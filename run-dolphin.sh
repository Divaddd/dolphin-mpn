#!/bin/bash
nohup ./dolphin-emu > /dev/null 2>&1&
jobs
disown %1
sleep .1
exit
