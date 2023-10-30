# clean
killall 'Cisco Secure Client' &> /dev/null
/opt/cisco/secureclient/bin/vpn -s disconnect &> /dev/null

# connect
expect -c "
    log_user 0
    spawn /opt/cisco/secureclient/bin/vpn connect ${VPN_HOST}
    expect \"Username:\"
    send \"${USER}\n\"
    expect \"Password:\"
    send \"`security find-generic-password -s "vpn_password" -w`\n\"
    expect \"state: Connected\"
    exit 0
"
