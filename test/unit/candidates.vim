source plugin/increment_activator.vim

describe 'Candidates generation'
  after
    let g:increment_activator_no_default_candidates = 0 " By the default
    call increment_activator#candidates#clear()
  end

  it 'generates defined by the default'
    let candidates = increment_activator#candidates#generate('')

    Expect has_key(candidates, 'sunday') == 1
    Expect has_key(candidates, 'SUNDAY') == 1
    Expect has_key(candidates, 'Sunday') == 1
  end

  it 'defines no default candidates'
    let g:increment_activator_no_default_candidates = 1
    Expect has_key(increment_activator#candidates#generate(''), 'sunday') != 1
  end

  it 'defines user config'
    let g:increment_activator#config = {
      \   '_': [
      \     ['GoodMorning', 'GoodEvening'],
      \   ],
      \ }
    Expect has_key(increment_activator#candidates#generate(''), 'GoodMorning') == 1
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
    Expect has_key(increment_activator#candidates#generate('vim'), 'autocmd') == 1
    " Not includes to other filetypes
    Expect has_key(increment_activator#candidates#generate('ruby'), 'autocmd') != 1
  end
end
