#!/bin/bash

MEMORY_FREE=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{print 100-$5}')

sketchybar -m --set $NAME label=$MEMORY_FREE
