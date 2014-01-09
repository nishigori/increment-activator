source plugin/increment_activator.vim

describe 'Candidates generation'
  after
    let g:increment_activator_no_default_candidates = 0 " By the default
    call increment_activator#candidates#clear()
  end

  it 'generates defined by the default'
    let candidates = increment_activator#candidates#generate('')

    Expect has_key(candidates, 'sunday') to_be_true
    Expect has_key(candidates, 'SUNDAY') to_be_true
    Expect has_key(candidates, 'Sunday') to_be_true
  end

  it 'defines no default candidates'
    let g:increment_activator_no_default_candidates = 1
    Expect has_key(increment_activator#candidates#generate(''), 'sunday') to_be_false
  end

  it 'defines user config'
    let g:increment_activator#config = {
      \   '_': [
      \     ['GoodMorning', 'GoodEvening'],
      \   ],
      \ }
    Expect has_key(increment_activator#candidates#generate(''), 'GoodMorning') to_be_true
  end

  it 'defines each file type'
    let g:increment_activator#config = {
      \   'vim': [
      \     ['augroup', 'autocmd'],
      \     ['paste', 'nopaste'],
      \   ],
      \   'ruby': [
      \     ['describe', 'context'],
      \   ],
      \ }
    Expect has_key(increment_activator#candidates#generate('vim'), 'autocmd') to_be_true
    " Not includes to other filetypes
    Expect has_key(increment_activator#candidates#generate('ruby'), 'autocmd') to_be_false
  end
end
