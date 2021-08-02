FROM ubuntu:latest

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y sudo curl git-core gnupg locales neovim zsh wget nano fonts-powerline && \
    locale-gen en_US.UTF-8 && \
    adduser --quiet --disabled-password --shell /bin/zsh --home /home/devuser --gecos "User" devuser && \
    echo "devuser:root" | chpasswd &&  usermod -aG sudo devuser

ADD scripts/installthemes.sh /home/devuser/installthemes.sh
ADD scripts/installthemes.sh /home/devuser/nvm.sh
USER devuser
ENV TERM xterm
ENV ZSH_THEME starship
CMD ["zsh"]

#wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh 