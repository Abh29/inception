#!/bin/bash

set -e

touch /etc/mosquitto/passwd

mosquitto_passwd -b /etc/mosquitto/passwd $MOSQUITTO_USER $MOSQUITTO_PASSWD

mosquitto -c /etc/mosquitto/conf.d/default.conf
