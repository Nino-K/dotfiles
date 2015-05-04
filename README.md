# dotfiles

Back up for all the configuration files using symlinks

To add files to track
```
$ mv .vim .dotfiles/vim
$ mv .vimrc .dotfiles/vimrc
$ mv .screenrc .dotfiles/screenrc
$ mv .gitconfig .dotfiles/gitconfig
$ ln -s .dotfiles/vim .vim
$ ln -s .dotfiles/vimrc .vimrc
$ ln -s .dotfiles/gitconfig .gitconfig
```
# Cloning onto another machine

Having done this, when you’re working with a new machine onto which you’d like to
clone your configuration, you clone the repository from GitHub, and delete any
existing versions of those files in your home directory to replace them with
symbolic links into your repository, like so:

```
$ git clone git@github.com:Nino-K/dotfiles.git .dotfiles
$ rm -r .vim .vimrc .screenrc .gitconfig
$ ln -s .dotfiles/vim .vim
$ ln -s .dotfiles/vimrc .vimrc
$ ln -s .dotfiles/gitconfig .gitconfig
```
