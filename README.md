# dotfiles

Back up for all the configuration files using symlinks

To add files to track

```
$ mv .vim .dotfiles/vim
$ mv .vimrc .dotfiles/vimrc
$ mv .bashrc .dotfiles/bashrc
```

# Cloning into another machine

```
$ git clone https://github.com/Nino-K/dotfiles.git .dotfiles
$ rm -r .vim .vimrc .bashrc
$ ln -s .dotfiles/vim .vim
$ ln -s .dotfiles/vimrc .vimrc
$ ln -s .dotfiles/bashrc .bashrc
```

# Install [Vundle](https://github.com/VundleVim/Vundle.vim)

```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.dotfiles/vim/bundle/Vundle.vim
```

# Install Plugins

```
$ vim
$ :PluginInstall
```

# Compile YouCompleteMe

make sure C
Make is already available

To compile:
```
$ cd ~/.dotfiles/vim/bundle/YouCompleteMe
```
with semantic support for C-family languages:
```
$ ./install.py --clang-completer
```
without semantic support for C-family languages:
```
$ ./install.py
```
