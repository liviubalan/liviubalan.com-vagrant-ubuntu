<?php
/**
 * (c) Liviu Balan <liv_romania@yahoo.com>
 * http://www.liviubalan.com/
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * apc_fetch
 * Fetch a stored variable from the cache
 *
 * @author Liviu Balan <liv_romania@yahoo.com>
 * @link http://php.net/manual/en/function.apc-fetch.php
 */
var_dump(apc_fetch(array(
    'CUR_DATE_5s_1',
    'CUR_DATE_5s_2',
    'CUR_DATE_5s_3',
    'CUR_DATE_0s_1',
    'CUR_DATE_0s_2',
    'CUR_DATE_0s_3',
)));
