<?php
/**
 * (c) Liviu Balan <liv_romania@yahoo.com>
 * http://www.liviubalan.com/
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

/**
 * apc_cas
 * Updates an old value with a new value
 *
 * @author Liviu Balan <liv_romania@yahoo.com>
 * @link http://php.net/manual/en/function.apc-cas.php
 * @link https://en.wikipedia.org/wiki/Compare-and-swap
 */
apc_store('foobar', 2);
echo '$foobar = 2' . '<br />';
echo '$foobar == 1 ? 2 : 1 = ', (apc_cas('foobar', 1, 2) ? 'ok' : 'fail') . '<br />';
echo '$foobar == 2 ? 1 : 2 = ', (apc_cas('foobar', 2, 1) ? 'ok' : 'fail') . '<br />';

echo '$foobar = ', apc_fetch('foobar') . '<br />';

echo '$f__bar == 1 ? 2 : 1 = ', (apc_cas('f__bar', 1, 2) ? 'ok' : 'fail') . '<br />';

apc_store('perfection', 'xyz');
echo '$perfection == 2 ? 1 : 2 = ', (apc_cas('perfection', 2, 1) ? 'ok' : 'epic fail') . '<br />';

echo '$foobar = ', apc_fetch('foobar') . '<br />';
