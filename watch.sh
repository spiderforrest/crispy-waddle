#!/usr/bin/env bash

# kill the server on ctrl c
trap 'lapis term; echo /watcher: terminated!/' INT

# start the server
lapis serve &

# watch every file the server doesn't touch for changes
inotifywait -mre modify --exclude "temp|compiled|logs" . |
  while read -r file;
  do
    # call the lapis command that refreshes the server in place
    lapis build >/dev/null
    echo "/watcher: $file changed!/"
  done

