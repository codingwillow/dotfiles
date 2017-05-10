if test ! $(which spoof)
then
  npm install spoof -g
fi

if test ! $(which promptinit)
then
  npm install --global pure-prompt
fi
