FROM debian

RUN apt-get update && apt-get install -y squid  && apt-get clean
RUN mkfifo /var/log/squid/logpipe && chown proxy:proxy /var/log/squid/logpipe

COPY source/entrypoint.sh /
COPY source/squid.conf /etc/squid/squid.conf

RUN chmod +x entrypoint.sh

EXPOSE 3128

ENTRYPOINT ["/entrypoint.sh"]
CMD ["squid"]