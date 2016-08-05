FROM redmine:3.3-passenger

COPY supervisor.sh /
COPY otro-entrypoint.sh /
ENTRYPOINT ["/supervisor.sh"]
CMD ["passenger", "start"]
