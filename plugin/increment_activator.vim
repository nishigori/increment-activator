"=============================================================================
" PACKAGE: IncrementActivator.vim
" FILE: plugin/increment_activator.vim
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
  echoerr 'IncrementActivator.vim does not supported version Vim (' . v:version . ').'
  finish
elseif exists('g:loaded_increment_activator')
  finish
endif
" }}}

let s:save_cpo = &cpo
set cpo&vim

if exists('g:increment_activator#config')
  let s:deprecated_msg = 'g:increment_activator#config is deprecated.'
    \ . ' Please use g:increment_activator_filetype_candidates.'
  echohl WarningMsg | echomsg s:deprecated_msg | echohl None
endif

" Global options definition " {{{
let g:increment_activator_no_default_candidates =
  \ get(g:, 'increment_activator_no_default_candidates', 0)
let g:increment_activator_no_default_key_mappings =
  \ get(g:, 'increment_activator_no_default_key_mappings', 0)

let g:increment_activator_filetype_candidates =
  \ get(g:, 'increment_activator_filetype_candidates', {})
" }}}

" Default Key mapping {{{
nnoremap <silent> <Plug>(increment-activator-increment)
  \ :<C-u>call increment_activator#increment()<CR>
nnoremap <silent> <Plug>(increment-activator-decrement)
  \ :<C-u>call increment_activator#decrement()<CR>
inoremap <silent> <Plug>(increment-activator-increment)
  \ <C-o>:<C-u>call increment_activator#increment()<CR>
inoremap <silent> <Plug>(increment-activator-decrement)
  \ <C-o>:<C-u>call increment_activator#decrement()<CR>

if !g:increment_activator_no_default_key_mappings
  nmap <silent> <C-a> <Plug>(increment-activator-increment)
  nmap <silent> <C-x> <Plug>(increment-activator-decrement)
endif
" }}}

let g:loaded_increment_activator = 1
let &cpo = s:save_cpo
unlet s:save_cpo