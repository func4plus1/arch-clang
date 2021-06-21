FROM archlinux:latest

# WORKAROUND for glibc 2.33 and old Docker
# See https://github.com/actions/virtual-environments/issues/2658
# Thanks to https://github.com/lxqt/lxqt-panel/pull/1562
RUN patched_glibc=glibc-linux4-2.33-4-x86_64.pkg.tar.zst && \
    curl -LO "https://repo.archlinuxcn.org/x86_64/$patched_glibc" && \
    bsdtar -C / -xvf "$patched_glibc"



RUN pacman -Syu --noconfirm && pacman -S --noconfirm git vim nodejs wget zsh npm clang gcc cmake python zlib make ninja lld && \
      git config --global user.name "John Doe" && \
      git config --global user.email johndoe@example.com

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

ARG WORKSPACE=/root 
WORKDIR $WORKSPACE

COPY .vimrc ${WORKSPACE}/.vimrc 
COPY plug.vim ${WORKSPACE}/.vim/autoload/plug.vim

RUN vim +PlugInstall +qall 

CMD ["zsh"]
