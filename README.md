# IncrementActivator.vim

[![Build Status](http://img.shields.io/travis/nishigori/increment-activator/master.svg?style=flat)](https://travis-ci.org/nishigori/increment-activator)
[![MIT Licensed](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://raw.githubusercontent.com/nishigori/increment-activator/master/MIT-LICENSE.txt)

![v:version >= 702](https://img.shields.io/badge/v:version->=%20702-007F00.svg?style=flat)
![nvim --version >= 0.1.7](https://img.shields.io/badge/nvim%20----version->=%20NVIM%200.1.7-54a23d.svg?style=flat)
![Script Type: Utility](http://img.shields.io/badge/script%20type-utility-000000.svg?style=flat)

The [Vim] powerful increment plugin

The behavior is like `<C-a>`, `<C-x>` increment or decrement number by the default [Vim][]

It has been enhanced to allow increment the list that you have defined

![SnapShot - IncrementActivator.vim](snapshot.gif)

[Vim]: http://vim.org/

## Installation

### Using [dein.vim](https://github.com/Shougo/dein.vim)

```viml
call dein#add('nishigori/increment-activator')
```

If you hope to do other approach, Please read more [Documentation](doc/vim-increment-activator.txt)

## Usage

### Kay map

On **Normal-mode**, This plugin defines the following key mapping automatically `<C-a>` & `<C-x>`

If you don't want there key mappings, please write on vimrc

```viml
let g:increment_activator_no_default_key_mappings = 1

" e.g) Original key mappings
nmap ab <Plug>(increment-activator-increment)
nmap az <Plug>(increment-activator-decrement)
```

If you want to be enabled to other `mode()`, please define map like this.

```viml
" Be enabled on insert-mode
imap <silent> <C-a> <Plug>(increment-activator-increment)
imap <silent> <C-x> <Plug>(increment-activator-decrement)
```

### Case of candidates for increment

The list will be generated in candidates patterns automatically

* no changes
* lower
* UPPER
* Capitalize

### Default list defined by plugin

* yes/no
* on/off
* true/false
* weekday (sunday <-> monday <-> wednesday <- ... -> saturday <-> sunday)
* weekday-shorten (sun <-> mon <- ... -> sat <-> sun)
* month (january <-> february <- ... -> december <-> january)
* month-shorten (jan <-> feb <- ... -> dec <-> jan)

If you want to disable default candidates, puts on vimrc

```viml
let g:increment_activator_no_default_candidates = 1
```

### Customization

You can define original list for increment / decrement :)

Type of `g:increment_activator_filetype_candidates` is dict. each key is Vim's filetype.

The candidates for priority is -

1. Current filetype (`&filetype`)
2. `_` key (`_` is special as apply to all filetypes)
3. number by default Vim

*Example $MYVIMRC:*

```viml
let g:increment_activator_filetype_candidates = {
  \   '_' : [
  \     ['Pythonista', 'PHPer', 'Gopher'],
  \     ['ぬるぽ', 'ガッ'],
  \     ['info', 'warning', 'notice', 'error'],
  \   ],
  \   'cucumber': [
  \     ['Given', 'And', 'When', 'Then'],
  \   ],
  \   'erlang': [
  \     ['module', 'export'],
  \     [
  \       'is_alive', 'is_atom', 'is_binary', 'is_bitstring',
  \       'is_boolean', 'is_float', 'is_function',
  \       'is_integer', 'is_list', 'is_number',
  \       'is_pid', 'is_port', 'is_process_alive',
  \       'is_record', 'is_reference', 'is_tuple',
  \     ],
  \   ],
  \   'git-rebase-todo': [
  \     ['pick', 'reword', 'edit', 'squash', 'fixup', 'exec'],
  \   ],
  \   'go': [
  \     ['true', 'false', 'iota', 'nil'],
  \     ['byte', 'complex64', 'complex128'],
  \     ['int', 'int8', 'int16', 'int32', 'int64'],
  \     ['uint', 'uint8', 'uint16', 'uint32', 'uint64'],
  \     ['float32', 'float64'],
  \     ['interface', 'struct'],
  \   ],
  \ }
```

More than, Please read [Documentation](doc/vim-increment-activator.txt)

## Author

* [Takuya Nishigori](http://github.com/nishigori)
