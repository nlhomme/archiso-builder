FROM library/archlinux:latest
RUN pacman -Sy
RUN pacman -S git archiso --noconfirm
ADD ./mirrorlist /etc/pacman.d/mirrorlist