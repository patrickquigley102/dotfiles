" Close NerdTREE prior to CtrlP being opened
let g:ctrlp_map = '' " Prevents CtrlP from overwriting the custom mapping
" Map Ctrl+P to: close nerd tree, invoke CtrlP and carriage return
nnoremap <c-p> :NERDTreeClose\|CtrlP<CR>

" Within CtrlP open in new horizontal split with ctrl+i (similar to NerdTree)
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("h")': ['<c-i>', '<c-cr>'],
    \ }
