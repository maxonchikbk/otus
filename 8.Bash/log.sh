#!/bin/bash
echo -n "FROM: " && cut -f 2 -d '[' /vagrant/access-4560-644067.log |  cut -f 1 -d ']' | head -n 1
echo -n "TO: " && cut -f 2 -d '[' /vagrant/access-4560-644067.log |  cut -f 1 -d ']' | tail -n 1
echo Quantity GET 
grep GET /vagrant/access-4560-644067.log | grep -Po '(\d{1,3}\.){3}\d{1,3}' | uniq -c | sort -r | head -n $1
echo Quantity POST 
grep POST /vagrant/access-4560-644067.log | grep -Po '(\d{1,3}\.){3}\d{1,3}' | uniq -c | sort -r | head -n $2
echo -n "Errors "
cut -f 2 -d ']' /vagrant/access-4560-644067.log | grep -v 200 | wc -l
echo Quantity Codes
sed 's!"*" !,!g' /vagrant/access-4560-644067.log | cut -f 2 -d ',' | cut -f 1 -d ' '| sort | uniq -c