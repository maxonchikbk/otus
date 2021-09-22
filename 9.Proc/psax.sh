#!/bin/bash
function myps {
echo -e "$(find /proc/ -maxdepth 1 -name "[[:digit:]]*" -exec cat {}/stat \; |  cut -f 1 -d ' ' | sed -n "$string"p) \
\t$(find /proc/ -maxdepth 1 -name "[[:digit:]]*" -exec cat {}/stat \; |  cut -f 7 -d ' ' | sed -n "$string"p)\
\t$(find /proc/ -maxdepth 1 -name "[[:digit:]]*" -exec cat {}/stat \; |  cut -f 3 -d ' ' | sed -n "$string"p)\
\t$(find /proc/ -maxdepth 1 -name "[[:digit:]]*" -exec cat {}/stat \; |  cut -f 43 -d ' ' | sed -n "$string"p)\
\t$(find /proc/ -maxdepth 1 -name "[[:digit:]]*" -exec cat {}/stat \; |  cut -f 2 -d ' ' | sed -n "$string"p)"
}
echo -e "PID\tTTY\tSTAT\tTIME\tCOMMAND"
IFS=$'\n'
string=1
for var in $(find /proc/ -maxdepth 1 -name "[[:digit:]]*")
do
myps $(find /proc/ -maxdepth 1 -name "[[:digit:]]*")
((string++))
# echo $string
done