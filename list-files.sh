#!/bin/sh

(
  echo '<html><body><table>'
  ls -lh --time-style="+%Y-%m-%d %H:%M:%S" $1 | grep -v total | grep -v index.html | awk '{ printf("<tr><td> <a href=\"%s\">%s</a></td> <td>%s</td> <td> %s %s %s </td></tr>\n", $9, $9, $5, $6, $7, $8); }'
  echo '</table></body></html>'
) > $1/index.html