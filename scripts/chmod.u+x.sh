
if [ -f "./bin/fun.js" ]; then
  if [ ! -x "./bin/fun.js" ]; then
      chmod u+x "./bin/fun.js"
  fi
fi
