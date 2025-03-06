an 1.105 PopUp.-SEP3- <Nop>

anoremenu 1.110 PopUp.Close\ Tab :tabclose<cr>

an 1.115 PopUp.-SEP4- <Nop>

let lines = readfile($VIMRCDIR . '/commands.vim')
for line in lines
  let items = split(line)
  if len(items) && items[0] == 'command!'
    let command = items[1]
    execute 'anoremenu 1.120 PopUp.Commands.' . command . ' :' . command . '<cr>'
  endif
endfor

anoremenu 1.130 PopUp.Open\ Terminal :term<cr>
