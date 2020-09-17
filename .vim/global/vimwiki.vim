" Set to not compatible with Vi features. Required for VimWiki
set nocompatible
" Turn on local commands per file based on type. Required for VimWiki
filetype plugin on
" Enable syntax highlighting
syntax on

" Set file location, syntax and extension
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

