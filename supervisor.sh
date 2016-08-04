#!/bin/bash

set -e
/bin/bash /otro-entrypoint.sh
/bin/bash /docker-entrypoint.sh $@
