---
 - name: task2
   hosts: server
   user: admin
   become: yes
   tasks:
       - name: Create a 1GiB partition
         parted:
              device: /dev/sdb
              number: 3
              part_start: 1303MiB
              part_end: 2327MiB
              state: present

       - name: Create a 1GiB partition
         parted:
              device: /dev/sdb
              number: 4
              part_start: 2328MiB
              part_end: 3352MiB
              state: present

       - name: 2 pvs
         lvg:
              vg: myvg
              pvs: /dev/sdb3,/dev/sdb4

       - name: lv create
         lvol:
              vg: myvg
              lv: mylv
              size: 1200m

       - name: xfs filesystem
         filesystem:
              fstype: xfs
              dev: /dev/myvg/mylv

       - name: directory for mount
         file:
              name: /mnt/task2_mount
              state: directory

       - name: mounted
         mount:
              src: /dev/myvg/mylv
              path: /mnt/task2_mount
              fstype: xfs
              state: mounted
