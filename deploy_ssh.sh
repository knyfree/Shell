#!/bin/sh
ssh $1 'mkdir -p ~/.ssh' && cat ~/.ssh/id_dsa.pub | ssh $1 "cat >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh && chmod 0644 ~/.ssh/* && chmod 0600 ~/.ssh/id_dsa"
 
