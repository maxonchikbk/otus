#!/bin/bash
echo -e "1:NIhigh $1 \n2:head $2\n3:NIlow $3 \n4:tail $4"
renice -n $1 -p $(ps aux | pgrep p.sh | head -n $2)
renice -n $3 -p $(ps aux | pgrep p.sh | tail -n $4)
