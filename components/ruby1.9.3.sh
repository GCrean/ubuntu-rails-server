#!/bin/bash

DESCRIPTION="Install ruby1.9.3 from brightbox ppa"


install()
{
  echo "TODO: add the brightbox ppa"
  sudo apt-get install ruby1.9.3
}

uninstall()
{
  sudo echo "apt-get remove ruby1.9.3"
}

. `dirname $0`/base/component.sh
