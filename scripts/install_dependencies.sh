#!/bin/bash

set -e

HUGO_VERSION=0.72.0

install_tarred_tool()
{
  if [[ -x "$(command -v $1)" ]]; then
    echo "$1 v$2 already installed..."
  else
    echo "Installing $1 v$2 via $3..."

    curl -sL $3 > $1.tar.gz
    tar -xvf $1.tar.gz --one-top-level=$1 --strip-components 1

    chmod +x $1
    sudo mv $1 /usr/local/bin

    rm -rf $1.tar.gz
  fi
}

install_hugo()
{
  install_tarred_tool "hugo" $HUGO_VERSION "https://github.com/gohugoio/hugo/releases/download/v$HUGO_VERSION/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz"
}

install_themes()
{
  git submodule init
  git submodule update --remote
}

main()
{
  install_hugo
  install_themes
}

main
