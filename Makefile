default: brew-bundle chef

bootstrap: check-requirements set-dotfiles-private set-dotfiles-public

check-requirements:
	@git --version > /dev/null 2>&1 || (echo "git is required" && exit 1)

set-dotfiles-public:
	test -d ~/.dotfiles-public || git clone --bare git@github.com:jeroenj/dotfiles.git ~/.dotfiles-public
	GIT_DIR=~/.dotfiles-public GIT_WORK_TREE=~ git config --local status.showUntrackedFiles no
	GIT_DIR=~/.dotfiles-public GIT_WORK_TREE=~ git config --local remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
	GIT_DIR=~/.dotfiles-public GIT_WORK_TREE=~ git fetch origin
	GIT_DIR=~/.dotfiles-public GIT_WORK_TREE=~ git branch --set-upstream-to=origin/master master
	test -f ~/.local/share/dotfiles/public || (\
		GIT_DIR=~/.dotfiles-public GIT_WORK_TREE=~ git reset --quiet . && \
		GIT_DIR=~/.dotfiles-public GIT_WORK_TREE=~ git checkout . \
	)

set-dotfiles-private:
	test -d ~/.dotfiles-private || git clone --bare git@gitlab.jeroenj.be:jeroen/dotfiles.git ~/.dotfiles-private
	GIT_DIR=~/.dotfiles-private GIT_WORK_TREE=~ git config --local status.showUntrackedFiles no
	GIT_DIR=~/.dotfiles-private GIT_WORK_TREE=~ git config --local remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
	GIT_DIR=~/.dotfiles-private GIT_WORK_TREE=~ git fetch origin
	GIT_DIR=~/.dotfiles-private GIT_WORK_TREE=~ git branch --set-upstream-to=origin/master master
	test -f ~/.local/share/dotfiles/private || (\
		GIT_DIR=~/.dotfiles-private GIT_WORK_TREE=~ git reset --quiet . && \
		GIT_DIR=~/.dotfiles-private GIT_WORK_TREE=~ git checkout . \
	)

brew-bundle:
	brew bundle install --no-upgrade --no-lock

chef:
	sudo chef-client -c `pwd`/solo.rb --local-mode -j `pwd`/nodes/`hostname | tr '[:upper:]' '[:lower:]'`.json $*
