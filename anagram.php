<?php

$inputArray = ["kita","atik","tika","aku","kia","makan","kua"];
$output = [];
foreach ($inputArray as $input){
    $stringParts = str_split($input);
    sort($stringParts);
    $sortedString =  implode('', $stringParts)."";
    $output[$sortedString][] = $input;
}
print_r($output);