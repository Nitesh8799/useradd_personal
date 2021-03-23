---
 - name: Task1
   hosts: server
   user: admin
   become: yes
   tasks:
       - name: Create a 800MiB partition
         parted:
             device: /dev/sdb
             number: 1
             part_start: 1MiB
             part_end: 801MiB
             state: present

       - name: make it a ext4 filesystem
         filesystem:
             fstype: ext4
             dev: /dev/sdb1

       - name: create a mount directory
         file:
             name: /mnt/task1_mount
             state: directory

       - name: Mount /dev/sdb1 on mount-point
         mount:
             src: /dev/sdb1
             path: /mnt/task1_mount
             fstype: ext4
             state: mounted

       - name: Create a 500MiB partition
         parted:
             device: /dev/sdb
             number: 2
             part_start: 802MiB
             part_end: 1303MiB
             state: present

       - name: Make a swap for 2nd partition
         filesystem:
             fstype: swap
             dev: /dev/sdb2
