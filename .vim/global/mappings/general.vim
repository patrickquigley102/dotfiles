" Map Esc to CapsLock when entering Vim. Reset on exit.
" You cannot do this within Vim's mapping system - it isn't
" aware of CapsLock. 
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
