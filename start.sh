#!/bin/bash

set -e
/bin/bash /plugins.sh
/bin/bash -c "envsubst < /tmp/configuration.yml > /usr/src/redmine/config/configuration.yml"

/bin/bash /docker-entrypoint.sh $@

#/bin/bash -c "envsubst '$SECRET_TOKEN $DELIVERY_METHOD $ADDRESS $PORT $AUTHENTICATION $DOMAIN $USER_NAME $PASSWORD $STARTTLS_AUTO' < /tmp/configuration.yml > /tmp/configuration2.yml"


