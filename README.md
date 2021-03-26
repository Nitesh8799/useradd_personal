# $1=group_file $2=Userslist $3=/sbin/nologin-users , password=redhat - change if needed
#!/bin/bash
for group in $(cat $1)
do
groupadd $group
done
for i in $(cat $2); do
        useradd -g $group $i
    echo "user $i added successfully!"
    echo $i:redhat | chpasswd
    echo "Password for user $i changed successfully"
done
#!/bin/bash
for nologin in $( cat $3 ); do
        useradd -s /sbin/nologin $nologin
    echo "user $nologin added successfully!"
    echo $nologin:redhat | chpasswd
    echo "Password for user $nologin changed successfully"
done
