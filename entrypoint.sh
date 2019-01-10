#!/bin/sh

set -e

mongod --fork --syslog

sh -c "npm $*"