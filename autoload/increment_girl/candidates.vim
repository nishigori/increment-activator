"=============================================================================
" PACKAGE: IncrementGirl.vim
" FILE: autoload/increment_girl/candidates.vim
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

let s:candidates = { '_': {} }


function! s:generate_word_types(word)
  let lower = tolower(a:word)
  let UPPER = toupper(a:word)
  let capitalization = matchstr(UPPER, '.') . matchstr(lower, '^.\zs.*')

  return [a:word, lower, UPPER, capitalization]
endfunction

function! s:generate(from_lists) " {{{
  let candidates = {}
  for word_list in a:from_lists
    " Prepared in advence for looping first
    let previous_word_types = s:generate_word_types(word_list[-1])
    let current_word_types = s:generate_word_types(word_list[0])

    let length = len(word_list)
    let index = 1
    for current_word in word_list
      let next_word = index != length ? word_list[index] : word_list[0]
      let next_word_types = s:generate_word_types(next_word)

      let w = 0
      while w < len(current_word_types)
        let candidates[current_word_types[w]] =
          \ [ previous_word_types[w], next_word_types[w] ]
        let w+= 1
      endwhile

      " Prepared in advance for looping next
      let previous_word_types = current_word_types
      let current_word_types = next_word_types

      let index += 1
    endfor
  endfor

  return candidates
endfunction " }}}

function! increment_girl#candidates#get(filetype) " {{{
  return has_key(s:candidates, a:filetype)
    \ ? s:candidates[a:filetype]
    \ : s:candidates['_']
endfunction " }}}

function! increment_girl#candidates#register(filetype, candidate_lists) " {{{
  let s:candidates[a:filetype] =
    \ extend(increment_girl#candidates#get(a:filetype), s:generate(a:candidate_lists))
endfunction " }}}

" It has a no side effect
function! increment_girl#candidates#no_extend_register(filetype, candidate_lists) " {{{
  let s:candidates[a:filetype] = s:generate(a:candidate_lists)
endfunction " }}}
