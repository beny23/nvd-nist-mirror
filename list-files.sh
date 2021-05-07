#!/bin/sh

DIR=$1

(
  echo '<html><body>'
  find $DIR -maxdepth 1 -type f -printf '%p %s %t\n' | grep -v index.html | sed 's#^[^ ]*#<a href="&">&</a>#' | sed '#$#<br>#'
  echo '</body></html>'
) > $DIR/index.html