## Setup

#### required packages termux

```bash
apt install neovim python-pip make nodejs luarocks lua-language-server ripgrep
```

#### required packages debian

```bash
sudo apt install neovim python3-pip ripgrep gcc make nodejs wl-clipboard luarocks tree-sitter-cli
```

#### install

```bash
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

```bash
git clone https://github.com/Linux-Noobs/NeoVim.git ~/.config/nvim && nvim
```
