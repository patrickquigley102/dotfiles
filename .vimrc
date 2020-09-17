" Install Vim Plug if missing.
" Vim Plug is a Plugin Manager for Vim.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins using Vim Plug
" ~/.vim/plugged is the dir Vim Plug will use.
call plug#begin('~/.vim/plugged')
    " Neo dark theme. https://github.com/KeitaNakamura/neodark.vim
    Plug 'KeitaNakamura/neodark.vim'
    " Nerd tree file explorer https://github.com/preservim/nerdtree
    Plug 'preservim/nerdtree'
    " Toggle relative or absolute line number
    " https://github.com/jeffkreeftmeijer/vim-numbertoggle
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    " A Wiki text file organiser in Vim
    Plug 'vimwiki/vimwiki'
call plug#end()

" Load all files in .vim/global with a .vim suffix.
runtime! /global/**/*.vim
