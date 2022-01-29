<?php

// inisiasi koneksi
$host = "localhost";
$user = "root";
$pw = "";
$db = "db_omeoo";
 

$conn = mysqli_connect($host,$user,$pw,$db) or die("Error" . mysqli_error($conn));

    $result = mysqli_query($conn,"SELECT * FROM tb_json order by Parent_ID ASC"); // mengurutkan Parent ID
    $json_response = array(); //inisiasi variabel untuk menampung array

    

    while ($row = mysqli_fetch_assoc($result)){ // looping untuk menampilkan data
        $row_array = array(); // membuat variabel untuk menampung data yang akan ditampilkan
        $row_array['c_id'] = $row['Category_ID']; // menambahkan array dengan nama c_id dengan kolom database category
        $row_array['name'] = $row['Name'];// menambahkan array dengan nama name dengan kolom database name 
        $row_array['child'] = array(); // membuat array untuk child
        $p_id = $row['Parent_ID'];  //mengambil data parent ID
    
        // jika data sudah diambil, akan dicek kembali untuk menginputkan Child ke parent berdasarkan parent id yang
        // tidak ditampilkan

        $option_qry = mysqli_query($conn,"SELECT * FROM tb_json WHERE Parent_ID<>$p_id order by Parent_ID ASC");
        while ($opt_fet = mysqli_fetch_assoc($option_qry)){
            $row_array['child'][] = array( // lalu data kategori sisanya akan dimasukan ke array multi dimensi
                'c_id' => $opt_fet['Category_ID'],
                'name' => $opt_fet['Name'],
            );
        }
        array_push($json_response, $row_array); //memasukan hasil dari row array ke variabel array json_response
    }
    echo json_encode($json_response); // menampilkan hasil array