#!/bin/bash

sudo lshw | grep "CPU" | grep "product:" | awk '{ print $2 }'
