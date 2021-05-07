#!/bin/sh

(
  echo '<html><body>'
  find -maxdepth 1 -type f -printf '%p %s %t\n' | grep -v index.html | sed 's#^[^ ]*#<a href="&">&</a>#' | sed '#$#<br>#'
  echo '</body></html>'
) > $1/index.html