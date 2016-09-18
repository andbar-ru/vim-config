function Menu()
	if &guioptions =~ "m"
		exec "set guioptions-=m"
	else
		exec "set guioptions+=m"
	endif
endfunction

function HiTrail(on)
    if a:on == 1
        highlight! link trailingSpace CursorLine
        match trailingSpace /\\\@<![\u3000[:space:]]\+$/
    else
        match none
    endif
endfunction

function ToggleHiTrail()
    if !exists('g:highlightTrailingSpace')
        let g:highlightTrailingSpace = 0
    endif
    if g:highlightTrailingSpace == 1
        let g:highlightTrailingSpace = 0
    else
        let g:highlightTrailingSpace = 1
    endif
    call HiTrail(g:highlightTrailingSpace)
endfunction
