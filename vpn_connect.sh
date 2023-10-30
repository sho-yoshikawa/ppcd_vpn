# clean
killall 'Cisco Secure Client' &> /dev/null
/opt/cisco/secureclient/bin/vpn -s disconnect &> /dev/null

# env
export VPN_HOST7=07-KKS-OCN
export VPN_HOST8=08-KKS-BBIQ
export VPN_HOST9=10-KKS-OCN_SSL
export VPN_HOST10=10-KKS-BBIQ_SSL

# default env
export VPN_HOST=${VPN_HOST7}

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
