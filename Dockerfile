# FROM ubuntu:18.04

FROM ubuntu:20.04

ENV TZ=America/New_York
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt --yes install apt-utils
RUN apt --yes install locales tzdata

ENV LANGUAGE="en_US.UTF-8"
ENV LANG="en_US.UTF-8"
ENV LC_ALL="en_US.UTF-8"

RUN locale-gen "en_US.UTF-8"
RUN apt --yes upgrade

RUN apt --yes install git sudo wget git-core unzip build-essential python3 python python3-pip
RUN apt --yes install python3-pexpect xz-utils debianutils xterm tar nano cmake
RUN apt --yes install qt5-default
RUN apt --yes install qtdeclarative5-dev

RUN mkdir /build

COPY ./qt-unified-linux-x64-4.0.1-1-online.run /build/qt-unified-linux-x64-4.0.1-1-online.run
COPY ./qtaccount.ini /root/.local/share/Qt/qtaccount.ini

RUN chmod +x /build/qt-unified-linux-x64-4.0.1-1-online.run

RUN cd /build &&\
    ./qt-unified-linux-x64-4.0.1-1-online.run --accept-licenses --da --ao --confirm-command install qt.tools.ninja qt.tools.qtcreator qt.tools.cmake qt.qt5.51210.gcc_64


