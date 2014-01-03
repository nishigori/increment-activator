source plugin/increment_activator.vim

describe 'default increment'
  after
    " Delete all line
    execute 'normal 1GdG'
  end

  it 'can increment weekday of currently word'
    put! = 'monday'
    execute "normal \<C-a>"
    Expect getline(1) == 'tuesday'
  end

  it 'can decrement weekday of currently word'
    put! = 'sunday'
    execute "normal \<C-x>"
    Expect getline(1) == 'saturday'
  end

  it 'can increment/decrement number by the default vim behavior'
    execute 'normal I1'
    execute "normal \<C-a>"
    Expect getline(1) == '2'

    execute "normal \<C-x>"
    execute "normal \<C-x>"
    execute "normal \<C-x>"
    Expect getline(1) == '-1'
  end
end
