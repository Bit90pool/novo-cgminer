FROM ubuntu:20.04

LABEL maintainer="charles@sentnl.io"
LABEL version="1.0"
LABEL description="Custom docker image for Bit90 cgminer"

ARG DEBIAN_FRONTEND=nointeractive

ENV PACKAGES="\
  build-essential \
  libcurl4-openssl-dev \
  software-properties-common \
  ubuntu-drivers-common \
  pkg-config \
  libtool \
  ocl-icd-* \
  opencl-headers \
  openssh-server \
"

RUN apt update && apt install --no-install-recommends -y $PACKAGES  && \
    add-apt-repository ppa:graphics-drivers/ppa && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean

RUN ubuntu-drivers autoinstall


#CMD ["/usr/sbin/ssgd", "-D"]
#CMD ["bash"]
ENTRYPOINT ["tail", "-f", "/dev/null"]