#!/bin/bash

grub-mkpasswd-pbkdf2

echo 'copy everything after is (example: grub.pbkdf2...etc all the way to the last character):'

echo ' paste it here: '

read key


echo "#!/bin/sh
exec tail -n +3 $0
# This file provides an easy way to add custom menu entries.  Simply type the
# menu entries you want to add after this comment.  Be careful not to change
# the 'exec tail' line above.

set superusers="root"
password_pbkdf2 root $key" >> /etc/grub.d/40_custom

cat /etc/grub.d/40_custom


grub-mkconfig -o /boot/grub/grub.cfg