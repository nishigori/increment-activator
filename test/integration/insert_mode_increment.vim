source plugin/increment_activator.vim

describe 'default increment'
  before
    " Define map for insert-mode
    imap <silent> <C-a> <Plug>(increment-activator-increment)
    imap <silent> <C-x> <Plug>(increment-activator-decrement)
  end

  after
    inoremap <C-a> <NOP>
    inoremap <C-x> <NOP>
    execute 'normal! 1GdG' | " Delete all line
    call increment_activator#candidates#clear()
  end

  it 'can increment number'
    execute "normal I1\<C-a>"
    Expect getline(1) == '2'

    execute "normal I\<C-x>\<C-x>\<C-x>"
    Expect getline(1) == '-1'
  end

  it 'can increment weekday of currently word'
    execute "normal Imonday\<C-a>"
    Expect getline(1) == 'tuesday'
  end

  it 'can decrement weekday of currently word'
    execute "normal Isunday\<C-x>"
    Expect getline(1) == 'saturday'
  end
end
