## Repo is based on Drew Neil's Vimcasts episode #27

http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

---
##### List of modules in this configuration 
[modules used in this configuration](modules.md)

* Note: neocomplete has been depricated in vim 8+.  I have switched this out for deoplete.

* Note: the following commands maybe distructive to your existing vim setup make sure you move your
~/.vim and ~/.vimrc out of the way eg:

```zsh
  mv ~/.vim ~/.vim_bak
  mv ~/.vimrc ~/.vimrc_bak
```

Once done then :

```zsh
mkdir ~/.vim
cd ~/.vim
```

```zsh
git clone git@github.com/cajone/dotvim.git . 
```
<i><b>( Use this if you have ssh keys in place : Note the trailing dot is important but will only work if .vim is empty )</b></i>

or


```zsh
git clone https://github.com/cajone/dotvim.git . 
```

<i><b>( Note the trailing dot is important but will only work if .vim is empty )</b></i>

```zsh
mkdir undodir  # this gives you persistent undo capabilities across sessions
```

If on a linux system run the next line:


```zsh
  ln -s ~/.vim/vimrc ~./vimrc
```

if on a windows system move the .vim/vimrc file to ~/.vimrc

Once this is done we need to download all the bundles defined as git submodules:

```zsh
git submodule update --init
```

To update this repo on your system after this init load do the following :

```zsh
cd ~/.vim
git pull
git submodule foreach git pull origin master
```
---
### Helptags
last but not least start <b>vim</b> and run <b>:Helptags</b> to load all the help files for the submodules

---
### \<leader\>
This vimrc file uses <b>'\\'</b>  as its leader key, if you wish to change this to something else change this line in the vimrc

```vim
    let mapleader='\'
```

---
### NeoVim (nvim)
To use this vimrc configuration with nvim :

start <b>nvim</b>

```vim
:help nvim-from-vim
```

but basically for unix installs do the following ( cribbed from docs https://neovim.io/doc/user/nvim.html#nvim-from-vim )

start <b>nvim</b>

1. To start the transition, create your |init.vim| (user config) file:

```vim
    :call mkdir(stdpath('config'), 'p')
    :exe 'edit '.stdpath('config').'/init.vim'
```

2. Add these contents to the file:

```zsh
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc
```

