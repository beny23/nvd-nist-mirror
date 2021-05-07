#!/bin/sh

(
  echo '<html><body>'
  ls -l $1 | grep -v index.html | sed 's/^.*/<a href="&">&<\/a><br\/>/'
  echo '</body></html>'
) > $1/index.html