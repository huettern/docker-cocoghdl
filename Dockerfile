FROM ubuntu:16.04

MAINTAINER Noah Huetter <noahhuetter@gmail.com>

RUN apt-get update && apt-get install -y \
  libgnat-4.9 \
  wget python python-pip \
  build-essential \
  git
  
# Install ghdl
COPY install_ghdl_v0.35_llvm.sh /
RUN chmod +x /install_ghdl_v0.35_llvm.sh && \
  /install_ghdl_v0.35_llvm.sh && \
  rm /install_ghdl_v0.35_llvm.sh

# Cleanup
RUN apt-get -y autoremove

# Setup env
VOLUME ["/source"]
WORKDIR /source
CMD ["bash"]
