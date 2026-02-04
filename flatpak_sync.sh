#!/bin/bash

if [ -d "$HOME/.var/app/dev.zed.Zed/config/zed/" ]; then
  echo "syncing zed files"
  rm -rf ./zed/.config/zed/*
  cp -r ~/.var/app/dev.zed.Zed/config/zed/* ./zed/.config/zed/
fi

