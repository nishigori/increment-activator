# IncrementGirl.vim

The powerful increment activator :older_woman: **Kawaii** :older_woman:

## Description

The behavior is like `<C-a>`, `<C-x>` increment or decrement number by the default [Vim][]

She has been enhanced to allow increment the list that you have defined

[Vim]: http://vim.org/

## Installation

### Using [NeoBundle.vim](https://github.com/Shougo/neobundle.vim)

```viml
NeoBundle 'nishigori/increment-girl'
```

If you hope to do other approach, Please read more [Documentation](doc/vim-increment-girl.txt)

## Usage

### Case of candidates for increment

The list that you define will be generated in candidates patterns automatically

* no change
* lower
* UPPER
* Capitalize

### Default defined list

* yes/no
  - yes <-> no
  - YES <-> NO
  - Yes <-> No
* on/off
  - on <-> off
  - ON <-> OFF
  - On <-> Off
* true/false
  - true <-> false
  - TRUE <-> FALSE
  - True <-> False
* weekday
  - sunday <-> monday <-> wednesday <- ... -> saturday <-> sunday
  - SUNDAY <-> MONDAY <-> WEDNESDAY <- ... -> SATURDAY <-> SUNDAY
  - Sunday <-> Monday <-> Wednesday <- ... -> Saturday <-> Sunday
*weekday-shorten
  - sun <-> mon <- ... -> sat <-> sun
  - SUN <-> MON <- ... -> SAT <-> SUN
  - Sun <-> Mon <- ... -> Sat <-> Sun
* month
  - january <-> february <- ... -> december <-> january
  - JANUARY <-> FEBRUARY <- ... -> DECEMBER <-> JANUARY
  - January <-> February <- ... -> December <-> January
* month-shorten
  - jan <-> feb <- ... -> dec <-> jan
  - JAN <-> FEB <- ... -> DEC <-> JAN
  - Jan <-> Feb <- ... -> Dec <-> Jan

If you want to disable default candidates, puts on vimrc

```viml
let g:increment_girl#enable_default_candidates = 0
```

### Examples on vimrc

Type of `g:increment_girl#config` is dict. each key is Vim's filetype.

The priorities candidate for increment, current filetype as the first, `_` key as the second.

```viml
let g:increment_girl#config = {
  \   '_' : [
  \     ['Pythonista', 'PHPer', 'Gopher'],
  \   ],
  \   'git-rebase-todo': [
  \     ['pick', 'reword', 'edit', 'squash', 'fixup', 'exec'],
  \   ],
  \   'erlang': [
  \     ['module', 'export'],
  \     ['author', 'copyright', 'doc', 'end'],
  \     [
  \       'is_alive', 'is_atom', 'is_binary', 'is_bitstring',
  \       'is_boolean', 'is_float', 'is_function',
  \       'is_integer', 'is_list', 'is_number',
  \       'is_pid', 'is_port', 'is_process_alive',
  \       'is_record', 'is_reference', 'is_tuple',
  \     ],
  \   ],
  \ }
```

## Author

* [Takuya Nishigori](http://github.com/nishigori)

## LICENSE

Licenced under the [MIT](http://opensource.org/licenses/MIT) License.
