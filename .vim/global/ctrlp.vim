" Ignore all files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Disable the cache, it'll scan for new files every time
let g:ctrlp_use_caching = 0
