if ! command -v zsh; then
    pkg update -y && pkg upgrade -y
    pkg install zsh -y

    if [ ! -d "$HOME/storage" ]; then
        termux-setup-storage
    fi

    for PACKAGE in "git htop neovim python rust openssl termux-api build-essential"; do
        pkg install $PACKAGE -y
    done

    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts && ./install.sh
    cd .. && echo yes | rm -rd fonts
    mkdir .termux
    cp '.local/share/fonts/Ubuntu Mono derivative Powerline.ttf' .termux/font.ttf
    mkdir -P .config/nvim
    curl "https://raw.githubusercontent.com/MoreUmph/termux-config/master/init.vim" -o .config/nvim/init.vim
    termux-reload-settings

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    zsh
fi
