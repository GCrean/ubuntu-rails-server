#!/bin/bash

echo "Installing Ubuntu Rails Webserver components.

You will be asked to confirm each component before it is installed. You can choose to skip them if you want.
"

#go through all the files in the components directory
#each is a standalone installation script which can be run in any order.
#each script should take care of it's own dependencies and requirements.
while true ; do
  echo "These scripts have been detected:"
  x=0
  for f in `ls components`
  do
    if [ -f "components/$f" ] ; then
      x=`expr $x + 1`
      echo "$x) $f - `components/$f --description`"
      comps[$x]=$f
    fi
  done

  read -p  "Indicate your action..." choice
  echo "installing: ${comps[$choice]}"
  ./components/${comps[$choice]} --install
done

exit 0
