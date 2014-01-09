source plugin/increment_activator.vim

describe 'default increment'
  after
    execute 'normal 1GdG' | " Delete all line
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
