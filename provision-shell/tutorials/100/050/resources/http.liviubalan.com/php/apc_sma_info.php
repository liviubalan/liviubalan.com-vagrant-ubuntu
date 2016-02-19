<?php
/**
 * (c) Liviu Balan <liv_romania@yahoo.com>
 * http://www.liviubalan.com/
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * apc_sma_info
 * Retrieves APC's Shared Memory Allocation information
 *
 * @author Liviu Balan <liv_romania@yahoo.com>
 * @link http://php.net/manual/en/function.apc-sma-info.php
 */
echo '<pre>';
print_r(apc_sma_info());
