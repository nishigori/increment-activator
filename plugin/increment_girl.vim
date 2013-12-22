"=============================================================================
" PACKAGE: IncrementGirl.vim
" FILE: plugin/increment_girl.vim
" AUTHOR: Takuya Nishigori <nishigori.tak@gmail.com>
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}
"=============================================================================
" vim:set fdm=marker ts=2 sw=2 sts=0:

" Load Once {{{
if v:version < 702
  echoerr 'IncrementGirl.vim does not supported version Vim (' . v:version . ').'
  finish
elseif exists('g:loaded_increment_girl')
  finish
endif
" }}}

let s:save_cpo = &cpo
set cpo&vim

" Key mapping {{{
nnoremap <silent> <C-a> :<C-u>call increment_girl#increment()<CR>
nnoremap <silent> <C-x> :<C-u>call increment_girl#decrement()<CR>
" }}}

let g:loaded_increment_girl = 1
let &cpo = s:save_cpo
unlet s:save_cpo
