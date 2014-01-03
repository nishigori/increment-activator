"=============================================================================
" PACKAGE: IncrementActivator.vim
" FILE: autoload/increment_activator/operator.vim
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

let s:operation_identifier_map = {
  \   'decrement': [0, "\<C-x>"],
  \   'increment': [1, "\<C-a>"],
  \ }

function! s:create_changable_word_cmd() " {{{
  if matchstr(getline('.'), '.', col('.') - 1) == ' '
    return 'wciw' " Jump to without white-spaces
  endif

  return 'ciw'
endfunction " }}}

function! increment_activator#operator#get_currently_word() " {{{
  " TODO: In future, it has been enhanced to allow many (date, datetime, ..)
  return expand('<cword>')
endfunction " }}}

function! increment_activator#operator#applies(identifier_key) " {{{
  let increment_identifiers = s:operation_identifier_map[a:identifier_key]
  let candidates = increment_activator#candidates#generate(&filetype)
  let cmd_count = (v:count < 1) ? 1 : v:count
  let i = 0
  while i < cmd_count
    let w = increment_activator#operator#get_currently_word()
    let exec_command = has_key(candidates, w)
      \ ? s:create_changable_word_cmd() . candidates[w][increment_identifiers[0]]
      \ : increment_identifiers[1]
    silent execute "normal! " . exec_command
    let i = i + 1
  endwhile
endfunction " }}}
