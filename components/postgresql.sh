#!/bin/bash

DESCRIPTION="Install postgresql"


install()
{
  sudo apt-get install postgresql
}

uninstall()
{
  sudo echo "apt-get remove postgresql"
}

. `dirname $0`/base/component.sh
