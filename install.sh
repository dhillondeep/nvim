#!/bin/bash

NVIM_CONFIG_PATH=~/.config/nvim
NVIM_BK_CONFIG_PATH="$NVIM_CONFIG_PATH.bk"
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# make copy of current nvim configuration
if [ -d $NVIM_CONFIG_PATH ]
then
  rm -rf $NVIM_BK_CONFIG_PATH
  mv $NVIM_CONFIG_PATH $NVIM_BK_CONFIG_PATH
  echo "Nvim configuration moved to $NVIM_BK_CONFIG_PATH"
else
  echo "No nvim configuration exists!"
fi

echo "Installing NvChad configuration"
git clone https://github.com/NvChad/NvChad $NVIM_CONFIG_PATH --depth 1

echo "Installing custom configuration"
rm -rf $NVIM_CONFIG_PATH/lua/custom
ln -s $SCRIPT_DIR/custom $NVIM_CONFIG_PATH/lua/custom
