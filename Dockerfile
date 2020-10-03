FROM ubuntu:18.04
LABEL maintainer="shihanlin9@gmail.com"

# install dependencies
RUN apt-get update -y
RUN apt-get install -y libgtk-3-dev libcairo2-dev libgit2-dev transfig imagemagick
RUN apt-get install -y git
RUN git clone --branch v1.0 https://github.com/fruitiot/eeshow-mirror.git

# build tool
RUN cd eeshow-mirror && make && make install

# action logic
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
