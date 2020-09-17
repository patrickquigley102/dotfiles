" Open Nerd Tree if vim issued without a file specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Show hidden files/directories
let NERDTreeShowHidden=1
