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

	DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	cd $DIR
	cp -r .vim ~/.vim

	#link to .vimrc file
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

	echo "Would you like to install pyflakes (python sytax checker)"
	echo "(Y/n)"
	read con
	if [ "$con" == "Y" ]; then
		echo "Installing pyflakes"
		cd ~/.vim/bundle/pyflakes/
		sudo python setup.py install
		sudo rm -rf ~/.vim/bundle/pyflakes/build	
	fi


	echo "Would you like to install jslint (javascript sytax checker)"
	echo "(Y/n)"
	read con
	if [ "$con" == "Y" ]; then
		echo "Installing jslint"
		cd $DIR
		svn co https://javascriptlint.svn.sourceforge.net/svnroot/javascriptlint/trunk jsl
		cd jsl
		sudo python setup.py install
		sudo rm -rf jsl
	fi

	echo "Would you like to install exuberant-ctags (used by the tagbar plugin)"
	echo "(Y/n)"
	read con
	if [ "$con" == "Y" ]; then
		installed=
		sudo apt-get install exuberant-ctags || installed=no
		if [ "$installed" = no ]; then
			echo "Could not install exuberant-ctags used by the taglist plugin"
		fi
	fi
fi
