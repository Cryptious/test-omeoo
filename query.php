<?php
$host = "localhost";
$user = "root";
$pw = "";
$db = "db_omeoo";
 
$conn = mysqli_connect($host,$user,$pw,$db) or die("Error" . mysqli_error($conn));

$query = mysqli_query($conn, 'select * from vw_prod');
 
if (mysqli_num_rows($query) > 0) {
	# buat array
	$responsistem = array();
	$responsistem["data"] = array();
	while ($row = mysqli_fetch_assoc($query)) {
		# kerangka format penampilan data json
		$data['id'] = $row["ID"];
		$data['name'] = $row["Name"];
		$data['harga'] = $row["Price"];
		$data['nama_variant'] = $row["variant_name"];
		$data['nama_gambar'] = $row["img_name"];
		array_push($responsistem["data"], $data);
 
	}
	echo json_encode($responsistem);
} else {
	# menmapilkan pesan jika tidak ada data dalam tabel
	$responsistem["message"]="tidak ada data";
	echo json_encode($responsistem);
}
