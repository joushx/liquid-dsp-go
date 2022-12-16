FROM mcr.microsoft.com/devcontainers/go:0-1-bullseye

RUN apt-get update && apt-get install autoconf make swig --yes
RUN cd /tmp && git clone https://github.com/jgaeddert/liquid-dsp.git && cd liquid-dsp && git checkout v1.3.2 && ./bootstrap.sh && ./configure && make && sudo make install && sudo ldconfig