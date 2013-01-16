#!/bin/bash

DESCRIPTION="Install git"


install()
{
  sudo apt-get install git-core
}

uninstall()
{
  sudo echo "apt-get remove git-core"
}

. `dirname $0`/base/component.sh
