#!/bin/bash
cat >/usr/lib/initcpio/install/testmodule <<EOF
#!/bin/bash

build() {
    add_runscript
}

help() {
    cat <<HELPEOF
test module neofetch
HELPEOF
}

# vim: set ft=sh ts=4 sw=4 et:
EOF
cat >/usr/lib/initcpio/hooks/testmodule <<EOM
#!/usr/bin/ash
run_hook() {
cat << EOF
 ___________________
< I'm hook module >
 -------------------
EOF
echo " continuing... "
sleep 10
}
# vim: set ft=sh ts=4 sw=4 et:
EOM
sed -i 's/(base/(testmodule base/g' /etc/mkinitcpio.conf
mkinitcpio -p linux