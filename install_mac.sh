#!/bin/bash

# sudo apt-get install -y vim

ln .style.yapf ~/.
ln .vimrc ~/.

# bash git completion
# sudo apt-get install -y git-core bash-completion
# echo "" >> ~/.bashrc
# echo "if [ -f /etc/bash_completion ] && ! shopt -oq posix; then" >> ~/.bashrc
# echo "    . /etc/bash_completion" >> ~/.bashrc
# echo "fi" >> ~/.bashrc

# setup git config options
git config --global user.email "zdwiel@gmail.com"
git config --global user.name "Zach Dwiel"
git config --global push.default current

# install vim plugins
# sudo apt-get install -y curl
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# yapf needed for vim plugins
sudo pip install yapf

# OS X:
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
chmod a-x ~/.git-completion.bash

echo "if [ -f ~/.git-completion.bash ]; then" >> ~/.bashrc
echo "  . ~/.git-completion.bash" >> ~/.bashrc
echo "fi" >> ~/.bashrc
