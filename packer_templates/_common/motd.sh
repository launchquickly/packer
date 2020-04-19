#!/bin/sh -eux

launchquickly='
This system is built by the Packer project by Launchquickly Ltd
More information can be found at https://github.com/launchquickly/packer'

if [ -d /etc/update-motd.d ]; then
    MOTD_CONFIG='/etc/update-motd.d/99-launchquickly'

    cat >> "$MOTD_CONFIG" <<LAUNCHQUICKLY
#!/bin/sh

cat <<'EOF'
$launchquickly
EOF
LAUNCHQUICKLY

    chmod 0755 "$MOTD_CONFIG"
else
    echo "$launchquickly" >> /etc/motd
fi
