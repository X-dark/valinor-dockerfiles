#!/bin/bash

SCRIPT=/telerama-rss.pl
for category in {'une','cinema','ecrans','enfants','sortir','musique','radio','livre','debats-reportages'} ; do
  export TELERAMA_RSSFILE="/usr/share/nginx/html/telerama_${category}.rss"
  export TELERAMA_CATEGORY=${category}
  $SCRIPT
done