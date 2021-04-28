<?php
    

    include '../config/connection.php';

    if($_SERVER['REQUEST_METHOD'] == 'POST') {
        // Ketika membuat variable boleh bebas, sesuai ketentuan
        // Jangan spasi, diawali dengan angka, simbol atau yang lainnya
        $nis = $_POST['nis'];
        
        // Deklarasikan dulu Query dalam Variable
        // $variable = mysqli_query($_variable_authentikasi, query)
        $querysearch_user = mysqli_query($_AUTH, "SELECT * FROM tbl_datasiswa WHERE nis = '$nis'");

        $response = array();

        // mysqli_num_rows = berfungsi untuk membaca total data yang diatmpilkan ketika query di execute
        $execute_querylogin = mysqli_num_rows($querysearch_user);

        // Berfungsi untukmencari id_user yang diinputkan melalui parameter usernmae dicari juga berdasasrkan usernamenya
        $cari_nis = "SELECT nis FROM tbl_datasiswa WHERE nis = '$nis'";
        $execute_carinis = mysqli_query($_AUTH, $cari_nis);
        $get_nis = mysqli_fetch_assoc($execute_carinis);

        $nis_result = $get_nis['nis'];

        if ($execute_querylogin > 0) {
            // Berhasil login
            $get_nis = $_POST['nis']; 

            $query_mencaridatasiswa = "SELECT COUNT(*) total_data FROM tbl_datasiswa WHERE nis = $get_nis";
            $execute_caridatasiswa = mysqli_query($_AUTH, $query_mencaridatasiswa);
            $get_ketersediaan_data = mysqli_fetch_assoc($execute_caridatasiswa);

            if($get_ketersediaan_data['total_data'] > 0) {

                $query_tampilkandatahasilcari = "SELECT * FROM tbl_siswa WHERE nis = $get_nis";
                $execute_tampilkandatasiswa = mysqli_query($_AUTH, $query_tampilkandatahasilcari);

                // Untuk menampilkan informasi

                $response['message'] = "Data siswa dengan NIS $nis terdaftar di database";
                $response['code'] = 201;
                $response['status'] = true;
                $response['datasearched'] = array();


                while($row = mysqli_fetch_array($execute_tampilkandatasiswa)) {

                    $data = array();

                    $data['nama_siswa'] = $row['nama_siswa'];
                    $data['jenis_kelamin'] = $row['jenis_kelamin'];
                    $data['alamat'] = $row['alamat'];
                    $data['no_telp'] = $row['no_telp'];
                    $data['email'] = $row['email'];
                    $data['tgl_terdaftar'] = $row['tgl_terdaftar'];

                    array_push($response['datasearched'], $data);
                }

                echo json_encode($response);
            } else {

                // Data tidak tersedia didatabase

                $response['message'] = "Data notes dengan id $get_nis tidak tersedia di database";
                $response['code'] = 404;
                $response['status'] = false;
                echo json_encode($response);
            }

        } else {
            // Gagal login
            $response["message"] = trim("Autentikasi gagal, Cek kembali user credential anda.");
            $response["code"] = 401;
            $response["status"] = false;
            echo json_encode($response);
        }

    } else {
        $response["message"] = trim("Oops! Sory, Request API ini membutuhkan parameter!.");
        $response["code"] = 400;
        $response["status"] = false;

        echo json_encode($response);
    }

?>