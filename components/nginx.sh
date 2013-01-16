#!/bin/bash

DESCRIPTION="Install nginx from brightbox ppa"


install()
{
  echo "TODO: add the brightbox ppa"
  sudo apt-get install nginx
}

uninstall()
{
  sudo echo "apt-get remove nginx"
}

. `dirname $0`/base/component.sh
