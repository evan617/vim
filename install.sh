#!/bin/bash

red() {
    echo -e "\033[31m$1\033[0m"
}

green() {
    echo -e "\033[32m$1\033[0m"
}


install_zsh() {
    release=`awk '{if (($1=="Debian")||($1=="CentOS")||($1=="Red")||($1=="Ubuntu")) print $1}' /etc/issue` 
    case $release in
        "CentOS")
            red "Install zsh..."
            yum -y install zsh
            ;;
        "Red")
            red "Install zsh..."
            yum -y install zsh
            ;;
        "Ubuntu")
            green "Install zsh..."
            apt-get -y install zsh
            ;;
        "Debian")
            green "Install zsh..."
            apt-get -y install zsh
            ;;
        *)
            echo "Invalid"
            ;;
    esac
    if [ ! -d ~/.oh-my-zsh ];then
        red "Install oh my zsh..."
        git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
        cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
        sed -i 's/^plugins.*/plugins=(git osx autojump)/g' ~/.zshrc
        green "Install zsh successfully..."
    fi

    if [ ! -d ~/honukai-iterm-zsh ];then
        green "Install theme..."
        git clone https://github.com/oskarkrawczyk/honukai-iterm-zsh ~/honukai-iterm-zsh
        cp ~/honukai-iterm-zsh/honukai.zsh-theme ~/.oh-my-zsh/themes
        sed -i 's/^ZSH_THEME.*/ZSH_THEME="honukai"/g' ~/.zshrc
    fi

    green "Change shell..."
    chsh -s /bin/zsh

    green "Now, please relogin..."
}


install_ide() {
    red "NOTIC: YouCompleteMe Plugin needs vim supported by python"
    red "Install vundle..."
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    red "cp vimrc ~/.vimrc"
    cp vimrc ~/.vimrc
    red "Install Plugins..."
    vim +PluginInstall +qall
    red "Compile YouCompleteMe"
    cd ~/.vim/bundle/YouCompleteMe
    python install.py
}

install_zsh
