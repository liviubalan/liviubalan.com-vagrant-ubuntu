<?php
/**
 * (c) Liviu Balan <liv_romania@yahoo.com>
 * http://www.liviubalan.com/
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * apc_exists
 * Checks if APC key exists
 *
 * @author Liviu Balan <liv_romania@yahoo.com>
 * @link http://php.net/manual/en/function.apc-exists.php
 */
var_dump(apc_exists('CUR_DATE_0s_1'));
var_dump(apc_exists('CUR_DATE_0s_1_NOT_FOUND'));

var_dump(apc_exists(array(
    'CUR_DATE_0s_1',
    'CUR_DATE_0s_1_NOT_FOUND',
)));
