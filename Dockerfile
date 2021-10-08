FROM kalilinux/kali-rolling

MAINTAINER "Captain Nick Lucifer* (*pronounced Lu-cipher) <naryal2580@gmail.com>"

LABEL I am neither responsible nor creditable for the amazing work by the projects I am using.

RUN apt update && apt dist-upgrade -y && apt install sudo

# A bit of fanciness.
RUN apt install zsh zsh-syntax-highlighting zsh-autosuggestions -y && usermod --shell /bin/zsh root

# Line below will take some good amount of time, since it's installing a lot of tools!
RUN apt install kali-linux-headless kali-tools-information-gathering kali-tools-vulnerability kali-tools-web kali-tools-database kali-tools-passwords kali-tools-reverse-engineering kali-tools-exploitation kali-tools-social-engineering kali-tools-post-exploitation kali-tools-forensics -y

COPY meta.sh /

RUN bash /meta.sh
