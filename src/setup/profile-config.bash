#!/usr/bin/env bash

install_omz_jc(){
  set -euxo pipefail
  # check if zsh is installed
  test -e /usr/bin/zsh || apt update && apt install -y zsh git curl && rm -rf /var/lib/apt/lists/*
  # Make it your default shell: chsh -s $(which zsh) or use sudo lchsh $USER if you are on Fedora
  # https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH
  printenv SHELL | grep -iwq zsh || chsh -s $(which zsh) $(whoami) && export SHELL=$(which zsh)
  # check if oh-my-zsh is installed
  # https://github.com/ohmyzsh/ohmyzsh/issues/5873
  test -e $HOME/.oh-my-zsh || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -s --batch
  # check if zsh-autosuggestions is installed
  test -e $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions \
    || git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' /root/.zshrc
  # check if zsh-syntax-highlighting is installed

  # check if default is zsh - to verify... might need sudo  / fix me...
  # printenv SHELL | grep -iwq zsh || chsh -s /bin/zsh $(whoami)
  grep -iwq "append-zsh-alias.sh#KEY" $HOME/.zshrc || cat ./assets/profile-utils/append-zsh-alias.sh >> $HOME/.zshrc
  # FIXME use etag or something / diff / merge
  
}


main(){
  set -euxo pipefail
  install_omz_jc
}


if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # echo "Script is being executed"
    main
    exit 0
else
    # echo "Script is being sourced"
    return 0
fi
source ./src/setup/profile-config.bash
printenv SHELL | grep -iwq zsh || chsh -s /bin/zsh $(whoami)
printenv SHELL # empty? wth
chsh --help

# source cannot exit...
# exit 0
# ENV PATH "/root/.local/bin:${PATH}"
# chmod +x src/setup/profile-config.bash
