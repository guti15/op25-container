FROM debian:12.11
LABEL authors="bobbyg"

RUN apt-get update
RUN apt-get install -y  \
     clang-format  \
     clang-format-14  \
     cmake \
     cmake-data \
     cmake-data \
     cmake-doc \
     cmake-format \
     doxygen \
     doxygen-doc \
     doxygen-gui \
     doxygen-latex \
     elpa-cmake-mode \
     git \
     gnuplot-x11 \
     gnuradio \
     gr-osmosdr \
     htop \
     libarchive13  \
     libarchive13 \
     libclang1-14 \
     libflac-dev  \
     libhackrf-dev  \
     libitpp-dev  \
     libjsoncpp25  \
     libjsoncpp25 \
     libmpg123-dev \
     libogg-dev \
     libopus-dev \
     liborc-0.4-dev  \
     liborc-0.4-dev-bin \
     liborc-0.4-doc \
     libout123-0 \
     libpcap-dev \
     librhash0  \
     librhash0 \
     librtlsdr-dev  \
     libsndfile1-dev  \
     libsyn123-0 \
     libuhd-dev libuv1 \
     libusb-1.0-0-dev \
     libusb-1.0-doc \
     libuv1 \
     libvorbis-dev \
     libxapian30 \
     lrzip \
     nano \
     ninja-build \
     python-requests-doc \
     python-waitress-doc \
     python3 \
     python3-certifi \
     python3-charset-normalizer \
     python3-cryptography \
     python3-openssl \
     python3-pybind11  \
     python3-requests  \
     python3-socks \
     python3-urllib3 \
     python3-waitress \
     rtl-sdr \
     uhd-doc \
     usbip \
     usbutils

RUN mkdir -p /usb-toolkit
COPY usb-toolkit/. /usb-toolkit/
RUN chmod -R u+x /usb-toolkit
ENV PATH="${PATH}:/usb-toolkit"

RUN mkdir -p /OP25-SDR
WORKDIR /OP25-SDR
RUN git clone https://github.com/boatbod/op25.git .
RUN cd /OP25-SDR/  && ./install.sh
WORKDIR /OP25-SDR/op25/gr-op25_repeater/apps

ENTRYPOINT ["/bin/bash"]