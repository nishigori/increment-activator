# IncrementActivator.vim [![Build Status](https://travis-ci.org/nishigori/increment-activator.png?branch=master)](https://travis-ci.org/nishigori/increment-activator) [![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/nishigori/increment-activator/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

The [Vim] powerful increment plugin

The behavior is like `<C-a>`, `<C-x>` increment or decrement number by the default [Vim][]

It has been enhanced to allow increment the list that you have defined

![SnapShot - IncrementActivator.vim](https://dl.dropboxusercontent.com/u/26664139/vim/snapshot_IncrementActivator.gif)

[Vim]: http://vim.org/

## Installation

### Using [NeoBundle.vim](https://github.com/Shougo/neobundle.vim)

```viml
NeoBundle 'nishigori/increment-activator'
```

If you hope to do other approach, Please read more [Documentation](doc/vim-increment-activator.txt)

## Usage

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

Type of `g:increment_activator#config` is dict. each key is Vim's filetype.

`_` is special as apply to all filetypes

The priorities candidate for increment, current filetype as the first, `_` key as the second.

*For exam:*

```viml
let g:increment_activator#config = {
  \   '_' : [
  \     ['Pythonista', 'PHPer', 'Gopher'],
  \     ['ぬるぽ', 'ガッ'],
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

### More than

Please read more [Documentation](doc/vim-increment-activator.txt)

## Author

* [Takuya Nishigori](http://github.com/nishigori)

## LICENSE

Licenced under the [MIT](http://opensource.org/licenses/MIT) License.
