## Custom Functions

# Sync dotfiles with Git Repo
syncdot() {
	# Sync local dotfiles / configurations with dotfiles repository
	DOTFILES_REPO_LOCAL_LOCATION="$HOME/Desktop/Work/configs"
	# NeoVim
	rsync \
		-av \
		--exclude='*.json*' \
		$HOME/.config/nvim/ \
		$DOTFILES_REPO_LOCAL_LOCATION/.config/nvim/
	# Zsh
	rsync \
		-av \
		--include='.zshrc' \
		--include='.aliasrc' \
		--include='.zshenv' \
		--include='.zprofile' \
		--exclude='*' \
		$HOME/ \
		$DOTFILES_REPO_LOCAL_LOCATION/zsh/

	# starship
	rsync \
		-av \
		--include='starship.toml' \
		--exclude='*' \
		$HOME/.config/ \
		$DOTFILES_REPO_LOCAL_LOCATION/.config/
	
	# alacritty	
	rsync \
		-av \
		--include='*' \
		$HOME/.config/alacritty/ \
		$DOTFILES_REPO_LOCAL_LOCATION/.config/alacritty/

	# tmux
	rsync \
		-av \
		--include='tmux.conf' \
		--exclude='*' \
		$HOME/.config/tmux/ \
		$DOTFILES_REPO_LOCAL_LOCATION/.config/tmux/

}

# Docker cleanup
removecontainers() {
    docker stop $(docker ps -aq)
    docker rm $(docker ps -aq)
}

armaggedon() {
    removecontainers
    docker network prune -f
    docker rmi -f $(docker images --filter dangling=true -qa)
    docker volume rm $(docker volume ls --filter dangling=true -q)
    docker rmi -f $(docker images -qa)
}


