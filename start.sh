#!/bin/bash

set -e
/bin/bash /plugins.sh
/bin/bash -c "envsubst < /tmp/configuration.yml > /usr/src/redmine/config/configuration.yml"
/bin/bash /docker-entrypoint.sh $@
