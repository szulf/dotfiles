#!/bin/bash

if [ -d "$HOME/.var/app/dev.zed.Zed/config/zed/" ]; then
  echo "copying zed files"
  rm -rf ~/.var/app/dev.zed.Zed/config/zed/*
  cp -r ./zed/.config/zed/* ~/.var/app/dev.zed.Zed/config/zed/
fi

