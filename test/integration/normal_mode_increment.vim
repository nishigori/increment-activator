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

describe 'increment target only current line'

  before
    put! = 'sunday' " Line3
    put! = '1'      " Line2
    put! = 'sun'    " Line1

    " Increment
    2 " Move to line 2
    execute "normal \<C-a>\<C-a>\<C-a>"
  end

  after
    execute 'normal 1GdG' | " Delete all line
  end

  it 'should increment currnetly line'
    Expect getline(2) == '4'
  end

  it 'should not increment next line'
    Expect getline(1) == 'sun'
  end

  it 'should not increment previous line'
    Expect getline(3) == 'sunday'
  end

end
