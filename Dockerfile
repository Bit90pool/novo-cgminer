FROM nvidia/opencl:devel-ubuntu18.04

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
  ocl-icd-opencl-dev\
  git \
  clinfo \
  autoconf \
"

RUN apt update && apt install --no-install-recommends -y $PACKAGES  && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean

RUN git clone https://github.com/Bit90pool/novo-cgminer.git /root/novo-cgminer
WORKDIR /root/novo-cgminer
ADD files/start.sh .

RUN chmod +x start.sh
CMD start.sh

#CMD ["/usr/sbin/ssgd", "-D"]
#CMD ["bash"]