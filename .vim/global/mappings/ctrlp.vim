" Close NerdTREE prior to CtrlP being opened
let g:ctrlp_map = '' " Prevents CtrlP from overwriting the custom mapping
" Map Ctrl+P to: close nerd tree, invoke CtrlP and carriage return
nnoremap <c-p> :NERDTreeClose\|CtrlP<CR>

let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-n>'],
  \ 'PrtSelectMove("k")':   ['<c-e>'],
  \ }
