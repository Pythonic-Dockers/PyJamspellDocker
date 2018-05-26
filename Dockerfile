FROM python:3.6.3

RUN echo "deb http://ftp.us.debian.org/debian unstable main contrib non-free" > /etc/apt/sources.list.d/unstable.list
RUN apt-get update
RUN apt-get install -y swig3.0 gcc-5 locales

RUN rm /usr/bin/gcc
RUN ln -s /usr/bin/gcc-5 /usr/bin/gcc

RUN apt-get install -y build-essential

RUN locale-gen en_US.UTF-8
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN pip install jamspell
