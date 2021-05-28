" Close NerdTREE prior to CtrlP being opened
let g:ctrlp_map = '' " Prevents CtrlP from overwriting the custom mapping
" Map Ctrl+P to: close nerd tree, invoke CtrlP and carriage return
nnoremap <c-p> :NERDTreeClose\|CtrlP<CR>

" Set open in h split as crtl+d
" Set open in v split as crtl+g
" Also swap the originals with whatever the conflicted with.
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("h")': ['<c-d>'],
  \ 'AcceptSelection("t")': ['<c-t>'],
  \ 'AcceptSelection("v")': ['<c-g>'],
  \ 'ToggleByFname()':      ['<c-x>'],
  \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-v>'],
  \ }
