#!/bin/bash
#installs the vim folder ti the users home directory 

echo "This will overwrite any existing vim settings"
echo "Continue? (Y/n)"

read con

if [ "$con" == "Y" ]; then

	#copy .vim directory
	if [ -d ~/.vim ]; then
		rm -rf ~/.vim
	fi
	cp -r .vim ~/.vim

	#copy .vim file
	if [ -f ~/.vimrc ]; then
		rm ~/.vimrc
	fi
	ln -s ~/.vim/.vimrc ~/.vimrc
	
	#install Vundle
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim +BundleInstall +qall

	echo "Creating sym links to use xmledit on other file types"
	ln -s ~/.vim/bundle/xmledit/ftplugin/xml.vim ~/.vim/bundle/xmledit/ftplugin/html.vim
	ln -s ~/.vim/bundle/xmledit/ftplugin/xml.vim ~/.vim/bundle/xmledit/ftplugin/erb.vim

	echo "Attempting to install exuberant-ctags"
	echo ""

	installed=
	sudo apt-get install exuberant-ctags || installed=no

	if [ "$installed" = no ]; then
		echo "Could not install exuberant-ctags used by the taglist plugin"
	fi
fi
