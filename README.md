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

If you hope to do other approach, Please read more [Documentation](doc/doc-increment-girl.txt)

## Usage

### Default defined list

```
  yes  <-> no
  on   <-> off
  true <-> false
  weekday (sunday <-> monday <-> wednesday <- .. -> saturday <-> sunday)
  weekday-shorten (sun <-> mon <-> .. sat <-> sun)
  month (january <-> february <-> .. <-> december <-> january)
  month-shorten (jan <-> feb .. dec <-> jan)
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
