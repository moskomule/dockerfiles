FROM moskomule/dockerfiles:cuda100

RUN apt-get update && apt-get install -y software-properties-common  \
    && add-apt-repository ppa:neovim-ppa/stable \
    && apt-get update && apt-get install -y -qq \
                          apt-utils \
                          bzip2 \
                          curl \
                          neovim \
                          language-pack-ja \
                          libboost-all-dev \
                          libsdl2-dev \
                          libsox-dev \
                          libsox-fmt-all \
                          locales \
                          openssh-server \
                          sox \
                          sshfs \
                          sudo \
                          swig \
                          tmux \
                          unzip \
                          xorg-dev \ 
                          xvfb \
                          zlib1g-dev \
                          zsh \
    && apt-get clean && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

    
# for ssh
RUN mkdir /var/run/sshd
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# nvidia-docker does't have these
RUN echo "export PATH=$PATH" >> /etc/profile && \
    echo "ldconfig" >> /etc/profile
    
# utilities etc.
COPY requirements.txt /tmp 
RUN pip install -U pip \
    && pip install --no-cache-dir -r /tmp/requirements.txt

# utf-8
RUN update-locale LANG=ja_JP.UTF-8


USER root
RUN echo "root:Docker!" | chpasswd
EXPOSE 22

# install linuxbrew
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

CMD ["/usr/sbin/sshd", "-D"]
