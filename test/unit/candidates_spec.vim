source plugin/increment_activator.vim

function! s:CleanUp()
  let g:increment_activator_no_default_candidates = 0 " By the default
  call increment_activator#candidates#clear()
endfunction

describe 'Candidates generation'

  describe 'Default definition'

    before
      let g:candidates = increment_activator#candidates#generate('')
    end

    after
      unlet g:candidates
      call s:CleanUp()
    end

    it 'should generates case of lower'
      Expect has_key(g:candidates, 'sunday') to_be_true
    end

    it 'should generates case of UPPER'
      Expect has_key(g:candidates, 'SUNDAY') to_be_true
    end

    it 'should generates case of Capitalize'
      Expect has_key(g:candidates, 'Sunday') to_be_true
    end

  end

  describe 'User definition'

    before
      let g:increment_activator_filetype_candidates = {
        \   '_': [
        \     ['GoodMorning', 'GoodEvening'],
        \   ],
        \ }
    end

    after
      call s:CleanUp()
    end

    it 'should not defines default candidates'
      let g:increment_activator_no_default_candidates = 1
      Expect has_key(increment_activator#candidates#generate(''), 'sunday') to_be_false
    end

    it 'should include filetype of all'
      Expect has_key(increment_activator#candidates#generate(''), 'GoodMorning') to_be_true
    end

  end

  describe 'Filetype definition'

    before
      let g:increment_activator_filetype_candidates = {
        \   'vim': [
        \     ['augroup', 'autocmd'],
        \     ['paste', 'nopaste'],
        \   ],
        \   'ruby': [
        \     ['describe', 'context'],
        \   ],
        \ }
    end

    after
      call s:CleanUp()
    end

    it 'should includes filetype'
      Expect has_key(increment_activator#candidates#generate('vim'), 'autocmd') to_be_true
    end

    it 'should not includes other filetype'
      Expect has_key(increment_activator#candidates#generate('ruby'), 'autocmd') to_be_false
    end

  end

end
