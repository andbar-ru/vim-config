" Force 'us' xkb lang when leaving insert mode.
" Restore last xkb lang when inserting insert mode again.
if !executable('xkb-switch')
  finish
endif

let s:main_lang = 'us'

function! s:XkbswitchInsertLeave()
  let curr_xkb_lang = system('xkb-switch -p')
  if curr_xkb_lang != s:main_lang
    silent execute '!xkb-switch -s ' . s:main_lang
  endif
  let b:last_xkb_lang = curr_xkb_lang
endfunction

function! s:XkbswitchInsertEnter()
  let curr_xkb_lang = system('xkb-switch -p')
  if exists('b:last_xkb_lang') && b:last_xkb_lang != curr_xkb_lang
    silent execute '!xkb-switch -s ' . b:last_xkb_lang
  endif
endfunction

augroup xkbswitch
  autocmd!
  autocmd InsertLeave * call <sid>XkbswitchInsertLeave()
  autocmd InsertEnter * call <sid>XkbswitchInsertEnter()
augroup end
