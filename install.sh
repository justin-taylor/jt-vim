#!/bin/bash
#installs the vim folder ti the users home directory 

EXUBERANT_CTAGS='http://downloads.sourceforge.net/project/ctags/ctags/5.8/ctags-5.8.tar.gz?r=http%3A%2F%2Fctags.sourceforge.net%2F&ts=1351905047&use_mirror=heanet'

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
	ln -snf $DIR/.vim ~/.vim

	#link to .vimrc file
	if [ -f ~/.vimrc ]; then
		rm ~/.vimrc
	fi
	ln -snf ~/.vim/.vimrc ~/.vimrc
	
	#install Vundle
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim +BundleInstall +qall

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
		wget -O ctags.tar.gz $EXUBERANT_CTAGS
		tar -zxvf ctags.tar.gz
		cd ctags-5.8
		./configure
		make && sudo make install
		cd ..
		rm -rf ctags.tar.gz ctags-5.8
	fi
fi

mkdir -p ~/.vim/backups
