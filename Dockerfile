FROM redmine:3.3-passenger

COPY start.sh /
COPY plugins.sh /
ENTRYPOINT ["/start.sh"]
CMD ["passenger", "start"]
