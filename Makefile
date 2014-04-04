SHELL = zsh
compile:
	for i in *.rc *.sh; do zcompile $$i;done

symlinks = zshrc inputrc tmux.conf gitconfig
install:
	for f in $(symlinks); do \
		test ! -f ~/.$$f -a ! -L ~/.$$f && ln -s $(PWD)/$$f ~/.$$f; \
	done
	sh install.sh
	
all: compile install
