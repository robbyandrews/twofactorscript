#!/bin/bash
if grep -wq "ChallengeResponseAuthentication yes" /etc/ssh/sshd_config; then
    echo "Line exists no changes made"
else
    sed -i '$a ChallengeResponseAuthentication yes'  /etc/ssh/sshd_config
fi

if grep -wq "AuthenticationMethods publickey,keyboard-interactive" /etc/ssh/sshd_config; then
    echo "Line exists no changes made"
else
    sed -i '$a AuthenticationMethods publickey,keyboard-interactive'  /etc/ssh/sshd_config
fi

if grep -wq "sshd-kbdint   auth required           /usr/local/lib/security/pam_google_authenticator.so" /etc/pam.conf; then
    echo "Line exists no changes made"
else
    sed -i '$a sshd-kbdint   auth required           /usr/local/lib/security/pam_google_authenticator.so' /etc/pam.conf
fi

if grep -wq "PermitRootLogin Yes" /etc/ssh/sshd_config; then
    echo "Line exists no changes made"
else
    sed -i 's/^\(PermitRootLogin \).*/\1Yes/' /etc/ssh/sshd_config
fi

