# $1=group_file $2=Userslist $3=/sbin/nologin-users , password=redhat - change if needed
#!/bin/bash
for group in $(cat $1)
do
groupadd $group
done
for test in $(cat $2)
do
useradd -g $group $test
echo $1:"redhat" | chpasswd
done
for user in $(cat $3)
do
useradd -s /sbin/nologin $user
echo $1:"redhat" | chpasswd
done
