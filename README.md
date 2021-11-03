# Denis Wahington's Dotfiles

This repository uses the configuration files of various tools I use.
Currently, it contains configurations for:

* [Emacs](./emacs/.emacs.d/init.el)
* [Git](./git/.gitconfig)
* [Vim](./vim/.vimrc) and [Neovim](./neovim/.config/nvim/init.lua)
* [Zsh](./zsh/.zshrc)

Feel free to reuse the files in this repository however you like.

## Usage

I use [GNU Stow][stow] to create symlinks from the configuration files
in this repository to the right locations in my home directory. For
instance, to activate my custom Zsh configuration, I simply run the
following from my checkout at `~/dotfiles`:

```sh
stow zsh
```

To switch to my [Oh-My-Zsh][oh-my-zsh]-based configuration (I still
haven't decided which I like better), I can run:

```sh
stow -D zsh
stow oh-my-zsh
```

For more details, see [_Using GNU Stow to manage your
dotfiles_][stow-dotfiles].

[stow]: https://www.gnu.org/software/stow/
[stow-dotfiles]: https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html
