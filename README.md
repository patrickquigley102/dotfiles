# Repo for dotfiles.

Stores bash and vim configuration.

## File Structure

This repo must live in $HOME. 

Here is an outline of the directory tree. Some directories are prefixed with a 
number to control the load order.

```
.bashfiles
  0env
  1config
  2aliases_and_functions
    eh 
.vim
  autoload # Vim Plug package manager
  global
    mappings
    themes
```

## Bash

Stores environment variables, configuration commands, aliases and functions 
used in Shells.

Useful source of configuration: https://terminalsare.sexy/

## Vim

Stores vim configuration.

Excellent Guide: https://vimways.org/2018/from-vimrc-to-vim/

### Eh? What are my aliases again?

There is the `eh` command. 

It'll print to stdout any aliases/function help files defined in 
`$HOME/.bashfiles/2aliases_and_functions/eh` that match the pattern provided.
E.G.
`eh docker`
