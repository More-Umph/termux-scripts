if ! command -v zsh; then
    if [ ! -d "$HOME/storage" ]; then
        termux-setup-storage
    fi

    pkg update -y && pkg upgrade -y
    pkg install zsh git htop neovim openssl termux-api -y

    mkdir -p .config/nvim
    curl "https://raw.githubusercontent.com/More-Umph/termux-scripts/master/init.vim" -o .config/nvim/init.vim
    
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts && ./install.sh
    cd .. && echo yes | rm -rd fonts
    mkdir .termux
    cp '.local/share/fonts/Ubuntu Mono derivative Powerline.ttf' .termux/font.ttf
    termux-reload-settings

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && sed -i 's/robbyrussell/agnoster/' .zshrc && source .zshrc
else
    zsh
fi
