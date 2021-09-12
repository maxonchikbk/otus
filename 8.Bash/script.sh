#!/bin/bash
/vagrant/log.sh 5 5 > /vagrant/log.txt
mail -s "Log" user@mail.local < /vagrant/log.txt