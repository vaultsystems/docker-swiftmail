#!/bin/bash

while true; do
	swift list > /tmp/swift.log
	sleep 60
done