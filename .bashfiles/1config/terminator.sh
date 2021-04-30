# Symlink the config file to where terminator expects it
rm -f ~/.config/terminator/config && mkdir -p ~/.config/terminator && ln -sf ~/terminator/config ~/.config/terminator/config
