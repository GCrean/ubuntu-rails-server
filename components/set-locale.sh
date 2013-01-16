#!/bin/bash

DESCRIPTION="Install correct locale settings"


install()
{
  sudo apt-get install languagepack-en
  echo
  read -p "Which country code should we configure on the locale? [ZA]" code
  code=${code:-ZA}
  echo "backup the locale file at /etc/defaults/locale"
  echo "set the locale in /etc/defaults/locale"
}

uninstall()
{
  sudo echo "leave the languagepack-en"
  sudo echo "restore the backed up locale file"
}

. `dirname $0`/base/component.sh
