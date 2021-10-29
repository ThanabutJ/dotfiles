#!/usr/bin/env bash
mouseid=$(xinput | grep -E "dELECOM.+pointer" | tr ' \t' '\n\n' | grep id= | awk -F= '{print $2}')
[ -z "$mouseid" ] && echo "ELECOM HUGE not found" && exit 1
echo $mouseid
