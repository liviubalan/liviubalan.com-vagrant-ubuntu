<?php
/**
 * apc_store
 * Cache a variable in the data store
 * http://php.net/manual/en/function.apc-store.php
 */
$ttl = 5;

$key = 'CUR_DATE_5s_1';
$var = date('c');
$result = apc_store($key, $var, $ttl);
var_dump($result);

$var = date('c') . ' overwrite';
$result = apc_store($key, $var, $ttl);
var_dump($result);

$key = 'CUR_DATE_0s_1';
$var = date('c');
$result = apc_store($key, $var);
var_dump($result);

$values = array(
    'CUR_DATE_5s_2' => date('c'),
    'CUR_DATE_5s_3' => rand(),
);
$result = apc_store($values, null, $ttl);
var_dump($result);

$values = array(
    'CUR_DATE_0s_2' => date('c') . ' overwrite',
    'CUR_DATE_0s_3' => rand() . ' overwrite',
);
$result = apc_store($values, null);
var_dump($result);
