FROM debian

RUN apt-get update && apt-get install -y squid  && apt-get clean

# make named pipes for logfiles
RUN mkfifo /var/log/squid/access.log && \
    chown proxy:proxy /var/log/squid/*.log && \
    mkdir /squid-cache && \
    chown proxy:proxy /squid-cache

COPY source/entrypoint.sh /
COPY source/squid.conf /etc/squid/squid.conf

RUN chmod +x entrypoint.sh

EXPOSE 3128

ENTRYPOINT ["/entrypoint.sh"]
CMD ["squid"]