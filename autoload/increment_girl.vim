"=============================================================================
" PACKAGE: IncrementGirl.vim
" FILE: autoload/increment_girl.vim
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

" Global options definition. " {{{
let g:increment_girl#config = get(g:, 'increment_girl#config', {})
" }}}

function! increment_girl#increment() " {{{
  let candidates = increment_girl#candidates#get(&filetype)
  let increment_identifier = 1
  let cmd_count = (v:count < 1) ? 1 : v:count
  let i = 0
  while i < cmd_count
    let w = expand('<cword>')
    let exec_command = has_key(candidates, w)
      \ ? "ciw" . candidates[w][increment_identifier]
      \ : "\<C-a>"
    echo exec_command
    silent execute "normal! " . exec_command
    let i = i + 1
  endwhile
endfunction " }}}

function! increment_girl#decrement() " {{{
  let candidates = increment_girl#candidates#get(&filetype)
  let decrement_identifier = 0
  let cmd_count = (v:count < 1) ? 1 : v:count
  let i = 0
  while i < cmd_count
    let w = expand('<cword>')
    let exec_command = has_key(candidates, w)
      \ ? "ciw" . candidates[w][decrement_identifier]
      \ : "\<C-x>"
    echo exec_command
    silent execute "normal! " . exec_command
    let i = i + 1
  endwhile
endfunction " }}}
