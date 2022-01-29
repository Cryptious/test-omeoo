<?php  
$string = "11237871";  
for($i=0; $i<strlen($string); $i++){   
    echo $string[$i];
  for($j=strlen($string)-1; $j>$i; $j--){  
    echo "0";  
    }  
    echo "<br>";  
}  
