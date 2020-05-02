default: brew-bundle chef

brew:
	brew bundle install --no-upgrade --no-lock

chef:
	sudo chef-client -c `pwd`/solo.rb --local-mode -j `pwd`/nodes/`hostname | tr '[:upper:]' '[:lower:]'`.json $*
