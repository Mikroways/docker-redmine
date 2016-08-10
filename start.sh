#!/bin/bash

set -e
/bin/bash /plugins.sh
/bin/bash /docker-entrypoint.sh $@
