#!/bin/bash

set -x

cd /opt/taiga-events

exec coffee index.coffee --config /opt/config.json
