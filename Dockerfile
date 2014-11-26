# Creates image with SSHD server 

FROM ubuntu:14.04

MAINTAINER Peter Bryzgalov @ AICS RIKEN

# RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y vim

# Set root password
RUN echo "root:docker" | chpasswd
ENV HOME /root
ENV TERM xterm-color
ENV PS1 "\t \[\e[0;31m\]\u\[\e[0m\]@\[\e[01;32m\]\h\[\e[0m\]:\[\e[0m\]\w\[\e[0m\]$"


# Install SSH
RUN apt-get install -y ssh
RUN mkdir -p /var/run/sshd

# Install python etc.
RUN apt-get install -y sshfs
RUN apt-get install -y git
RUN apt-get install -y nano
# RUN apt-get install -y vim-common
RUN apt-get install -y python

# VIM configuration
RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ADD vimrc /root/.vimrc
ADD colors/ /root/.vim/colors/

EXPOSE 22

CMD ["/bin/bash"]

