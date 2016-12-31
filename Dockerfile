# personal
RUN apt-get install -y vim

RUN git clone https://github.com/dwiel/dotfiles.git
RUN ln dotfiles/.vimrc .
RUN ln dotfiles/.style.yapf .

# bash git completion
RUN apt-get install -y git-core bash-completion
RUN echo "" >> ~/.bashrc
RUN echo "if [ -f /etc/bash_completion ] && ! shopt -oq posix; then" >> ~/.bashrc
RUN echo "    . /etc/bash_completion" >> ~/.bashrc
RUN echo "fi" >> ~/.bashrc

# setup git config options
RUN git config --global user.email "zach@nervanasys.com"
RUN git config --global user.name "Zach Dwiel"
RUN git config --global push.default matching

# install vim plugins
RUN apt-get install -y curl
RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN vim +PlugInstall +qall

# yapf needed for vim plugins
RUN pip install yapf

