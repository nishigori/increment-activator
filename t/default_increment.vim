source plugin/increment_activator.vim

describe 'default increment'
  it 'can increment weekday of currently word'
    put! = 'monday'
    call increment_activator#increment()
    Expect getline(1) == 'tuesday'
  end

  it 'can decrement weekday of currently word'
    put! = 'sunday'
    call increment_activator#decrement()
    Expect getline(1) == 'saturday'
  end
end
