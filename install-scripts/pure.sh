cd ~/.dotfiles
rm -rf pure
git clone https://github.com/sindresorhus/pure.git
mkdir ${HOME}/.oh-my-zsh/custom/themes
mkdir ${HOME}/.oh-my-zsh/functions/
ln -sf ${HOME}/.dotfiles/pure/pure.zsh ~/.oh-my-zsh/custom/themes/pure.zsh-theme
ln -sf $HOME/.dotfiles/pure/async.zsh ~/.oh-my-zsh/functions/async
ln -sf $HOME/.dotfiles/pure.zsh ~/.oh-my-zsh/functions/prompt_pure_setup
