#!/bin/bash

DESCRIPTION="Install mysql server"


install()
{
  sudo apt-get install mysql-server
}

uninstall()
{
  sudo echo "apt-get remove mysql-server"
}

. `dirname $0`/base/component.sh
