<?php
/**
 * (c) Liviu Balan <liv_romania@yahoo.com>
 * http://www.liviubalan.com/
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * apc_dec
 * Decrease a stored number
 *
 * @author Liviu Balan <liv_romania@yahoo.com>
 * @link http://php.net/manual/en/function.apc-dec.php
 */
var_dump("Let's do something with success");

apc_store('anumber', 42);

var_dump(apc_fetch('anumber'));

var_dump(apc_dec('anumber'));
var_dump(apc_dec('anumber', 10));
var_dump(apc_dec('anumber', 10, $success));

var_dump($success);

var_dump("Now, let's fail");

apc_store('astring', 'foo');

$ret = apc_dec('astring', 1, $fail);

var_dump($ret);
var_dump($fail);
