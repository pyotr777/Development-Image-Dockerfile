# Development environment. Includes:
# vim
# python
# git
# sshfs
#
# Creates image with SSHD server 

FROM ubuntu:14.04

MAINTAINER Peter Bryzgalov @ AICS RIKEN

RUN apt-get update && apt-get install -y  vim ssh sshfs git nano python

# Set root password
RUN echo "root:docker" | chpasswd
ENV HOME /root
ENV TERM xterm-color
ENV PS1 "\t \[\e[0;31m\]\u\[\e[0m\]@\[\e[01;32m\]\h\[\e[0m\]:\[\e[0m\]\w\[\e[0m\]$"


# Install SSH
RUN mkdir -p /var/run/sshd

# VIM configuration
RUN git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ADD vimrc /root/.vimrc
ADD colors/ /root/.vim/colors/

CMD ["/bin/bash"]

