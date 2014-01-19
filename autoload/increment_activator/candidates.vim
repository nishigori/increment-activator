"=============================================================================
" PACKAGE: IncrementActivator.vim
" FILE: autoload/increment_activator/candidates.vim
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

let s:candidates = {}

let s:default_candidates_lists = [
  \   ['sun', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat'],
  \   ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday'],
  \   ['jan', 'feb', 'mar', 'apr', 'may', 'june', 'july', 'aug', 'sep', 'oct', 'nov', 'dec'],
  \   ['january', 'february', 'march', 'april', 'may', 'june', 'july', 'august', 'september', 'october', 'november', 'december'],
  \   ['true', 'false'],
  \   ['yes', 'no'],
  \   ['on', 'off'],
  \ ]


function! s:generate_word_types(word) " {{{
  let lower = tolower(a:word)
  let UPPER = toupper(a:word)
  let Capitalization = matchstr(UPPER, '.') . matchstr(lower, '^.\zs.*')

  return [a:word, lower, UPPER, Capitalization]
endfunction " }}}

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

function! s:generate_file_alltype() " {{{
  if !has_key(s:candidates, '_')
    let l:user_defines_list = has_key(g:increment_activator_filetype_candidates, '_')
      \ ? copy(g:increment_activator_filetype_candidates['_']) : []
    let l:plugin_defines_list = !g:increment_activator_no_default_candidates
      \ ? copy(s:default_candidates_lists) : []
    let s:candidates['_'] = s:generate(extend(l:plugin_defines_list, l:user_defines_list))
  endif

  return s:candidates['_']
endfunction " }}}

function! increment_activator#candidates#generate(to_filetype) " {{{
  let file_type = empty(a:to_filetype) ? '_' : a:to_filetype
  if !has_key(s:candidates, file_type)
    let l:alltype_list = copy(s:generate_file_alltype())
    let l:user_defines_list = has_key(g:increment_activator_filetype_candidates, file_type)
      \ ? g:increment_activator_filetype_candidates[file_type] : []
    let s:candidates[file_type] = extend(l:alltype_list, s:generate(user_defines_list))
  endif

  return s:candidates[file_type]
endfunction " }}}

function! increment_activator#candidates#clear() " {{{
  let s:candidates = {}
endfunction " }}}
