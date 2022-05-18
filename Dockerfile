FROM ubuntu:20:04

LABEL maintainer="charles@sentnl.io"
LABEL version="1.0"
LABEL description="Custom docker image for Bit90 cgminer"

ARG DEBIAN_FRONTEND=nointeractive

ENV PACKAGES="\
  build-essential \
  libcurl4-openssl-dev \
  pkg-config \
  libtool \
  ocl-icd-* \
  opencl-headers \
  openssh-server \
"

RUN apt update && apt install --no-install-recommends -y $PACKAGES  && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean




#CMD ["/usr/sbin/ssgd", "-D"]
CMD ["bash"]