FROM docker.io/nginx:1

ADD https://framagit.org/fiat-tux/rss/telerama-rss/-/raw/main/telerama-rss.pl /telerama-rss.pl
ADD telerama-fetch-all.sh /telerama-fetch-all.sh

RUN apt update && \
  apt install -y libmojolicious-perl libxml-rss-perl && \
  apt-get remove --purge --auto-remove -y && rm -rf /var/lib/apt/lists/*

RUN chmod 555 /telerama-rss.pl /telerama-fetch-all.sh