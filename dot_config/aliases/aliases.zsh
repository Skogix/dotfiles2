alias vimrc="cd ~/.config/nvim;chezmoi edit init.lua"
alias zshrc="cd ~/;chezmoi .zshrc"
alias aliasrc="chezmoi edit ~/.config/aliases/aliases.zsh"
alias myip="curl http://ipecho.net/plain; echo"
alias install="cd ~/bin;nvim ~/bin/skogix.pkgs;sh /home/skogix/bin/archlinux.sh --skogix;chezmoi re-add;chezmoi apply"
alias lazychezmoi="chezmoi cd;lazygit"
alias edit="chezmoi edit; chezmoi apply"
# test
