#!/bin/bash
for group in $(cat $1)
do
groupadd $group
done
for test in $(cat $2)
do
useradd -g $group $test
passwd $test
done
for user in $(cat $3)
do
useradd -s /sbin/nologin $user
passwd $user
done
