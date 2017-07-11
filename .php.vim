" php & eccube abbreviate {{{
" ログ出力 - data/logs
ab debuglog GC_Utils_Ex::gfDebugLog("---- TRACE ----");<left><left>
" GC_Utils_Ex::gfPrintLog("dummy", CUSTOMER_LOG_REALFILE );                 
ab debugprint SC_Utils::sfPrintR();<left><left>

ab printlog $this->p();<LEFT><LEFT>
ab tracelog $this->log("---- TRACE LOG ----".__LINE__);

ab var_dump echo "<pre style='text-align:left;'>";<CR>var_dump($_SESSION);<CR>echo "</pre>";
ab trace echo "<pre style='text-align:left;'>";<CR>var_dump(debug_print_backtrace());<CR>echo "</pre>";
ab tempurl <!--{$TPL_URLPATH}-->
" get_defined_vars()

ab debugcon <!--{debug}-->
ab dumptemplatevar <pre><!--{php}-->print_r(get_template_vars());<!--{/php}--></pre>

" <!-- {$smarty.session} -->
" <!-- {$smarty.server|@debug_print_var} -->
" <!-- {$smarty.debugging} -->

" PHP perfomance
"$time_start = microtime(true);
"printf("Process Time : %.2f [s]\n", microtime(true) - $time_start);
" /php & eccube abbreviate }}}
