FROM redmine:3.3-passenger
RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*
COPY configuration.yml /tmp/configuration.yml
VOLUME /usr/src/redmine
COPY start.sh /
COPY plugins.sh /
ENTRYPOINT ["/start.sh"]
CMD ["passenger", "start"]
