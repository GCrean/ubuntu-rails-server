#!/bin/bash

DESCRIPTION="Create a new user for deployments"

getusername()
{
  read -p "what is the name of the user? [deploy]" name
  name=${name:-deploy}
}

install()
{
  getusername
  useradd $name
}

uninstall()
{
  getusername
  userdel $username
}

. `dirname $0`/base/component.sh
