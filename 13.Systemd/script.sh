#!/bin/bash
date >> /vagrant/log
grep -i $KEYWORD $LOG_FILE >> /vagrant/log