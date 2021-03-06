#!/bin/bash

set -e
set -o xtrace

export DEBIAN_FRONTEND=noninteractive

apt-get install -y \
      ca-certificates \
      gnupg

# Upstream LLVM package repository
apt-key add .gitlab-ci/container/llvm-snapshot.gpg.key
echo "deb https://apt.llvm.org/buster/ llvm-toolchain-buster-9 main" >/etc/apt/sources.list.d/llvm9.list

sed -i -e 's/http:\/\/deb/https:\/\/deb/g' /etc/apt/sources.list
echo 'deb https://deb.debian.org/debian buster-backports main' >/etc/apt/sources.list.d/backports.list
echo 'deb https://deb.debian.org/debian testing main' >/etc/apt/sources.list.d/testing.list

apt-get update

# Don't use newer packages from testing by default
cat >/etc/apt/preferences <<EOF
Package: *
Pin: release a=testing
Pin-Priority: 100
EOF

apt-get dist-upgrade -y

apt-get install -y --no-remove \
      git \
      git-lfs \
      libexpat1 \
      libllvm9 \
      liblz4-1 \
      libpcre32-3 \
      libpng16-16 \
      libpython3.7 \
      libvulkan1 \
      libwayland-client0 \
      libwayland-server0 \
      libxcb-ewmh2 \
      libxcb-randr0 \
      libxcb-keysyms1 \
      libxcb-xfixes0 \
      libxkbcommon0 \
      libxrandr2 \
      libxrender1 \
      python \
      python3-distutils \
      python3-mako \
      python3-numpy \
      python3-pil \
      python3-pytest \
      python3-requests \
      python3-six \
      python3-yaml \
      python3.7 \
      qt5-default \
      qt5-qmake \
      vulkan-tools \
      waffle-utils \
      xauth \
      xvfb \
      zlib1g

apt-get purge -y \
      gnupg

apt-get install -t buster-backports -y --no-remove \
    meson

apt-get autoremove -y --purge
