#!/bin/bash

set -xe

cd /opt/taiga-events

rkd :j2:render -s /opt/config.json.j2 -o /opt/config.json
exec coffee index.coffee --config /opt/config.json
