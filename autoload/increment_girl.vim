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

let s:start_upped = 0

function! increment_girl#initialize() " {{{
  if g:increment_girl#enable_default_candidates
    " Register default candidates
    call increment_girl#candidates#no_extend_register('_', [
      \   ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'],
      \   ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'],
      \   ['jan', 'feb', 'mar', 'apr', 'may', 'june', 'july', 'aug', 'sep', 'oct', 'nov', 'dec'],
      \   ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december'],
      \   ['true', 'false'],
      \   ['yes', 'no'],
      \   ['on', 'off'],
      \ ])
  endif

  let s:start_upped = 1
endfunction " }}}

function! increment_girl#increment() " {{{
  if !s:start_upped
    call increment_girl#initialize()
  endif

  call increment_girl#operator#apply('increment')
endfunction " }}}

function! increment_girl#decrement() " {{{
  if !s:start_upped
    call increment_girl#initialize()
  endif

  call increment_girl#operator#apply('decrement')
endfunction " }}}
