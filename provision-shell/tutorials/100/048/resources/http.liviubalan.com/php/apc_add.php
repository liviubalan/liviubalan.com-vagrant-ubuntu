<?php
/**
 * (c) Liviu Balan <liv_romania@yahoo.com>
 * http://www.liviubalan.com/
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * apc_add
 * Cache a new variable in the data store
 *
 * @author Liviu Balan <liv_romania@yahoo.com>
 * @link http://php.net/manual/en/function.apc-add.php
 */
$ttl = 5;

$key = 'CUR_DATE_5s_1';
$var = date('c');
$result = apc_add($key, $var, $ttl);
var_dump($result);

$var = date('c') . ' overwrite';
$result = apc_add($key, $var, $ttl);
var_dump($result);

$key = 'CUR_DATE_0s_1';
$var = date('c');
$result = apc_add($key, $var);
var_dump($result);

$values = array(
    'CUR_DATE_5s_2' => date('c'),
    'CUR_DATE_5s_3' => rand(),
);
$result = apc_add($values, null, $ttl);
var_dump($result);

$values = array(
    'CUR_DATE_0s_2' => date('c') . ' overwrite',
    'CUR_DATE_0s_3' => rand() . ' overwrite',
);
$result = apc_add($values, null);
var_dump($result);
