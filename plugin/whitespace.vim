" File: whitespace.vim
" Copyright (c) 2015, Heinrich Kruger (heindsight@kruger.dev)
" Distributed under the MIT license (see ../LICENSE)

if exists('g:loaded_whitespace')
    finish
endif
let g:loaded_whitespace=1

if !hlexists('ExtraWhitespace')
    highlight link ExtraWhitespace Error
endif

" Turn off highlighting extra whitespace
function! s:Highlight_extra_ws(add, delete)
    let l:matches = getmatches()
    let l:found = 0
    for l:group in l:matches
        if l:group['group'] == 'ExtraWhitespace'
            let l:found = 1
            if a:delete
                call matchdelete(l:group['id'])
            endif
        endif
    endfor
    if a:add && !l:found
        call matchadd('ExtraWhitespace', '\s\+$',  -1)
    endif
endfunction

command! WSHighlightOn call s:Highlight_extra_ws(1, 0)
command! WSHighlightOff call s:Highlight_extra_ws(0, 1)
command! WSHighlightToggle call s:Highlight_extra_ws(1, 1)

" Strip whitespace from ends of lines in range
function! s:Strip_eol_ws() range
    try
        execute a:firstline . ',' . a:lastline . 's/\s\+$//e'
    catch /E486:/
        echoerr "No end-of-line whitespace found"
    endtry
endfunction

command! -range=% WSStrip <line1>,<line2>call s:Strip_eol_ws()
