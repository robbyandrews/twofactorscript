#!/bin/bash
sed -i 's/^\(PermitRootLogin \).*/\1Yes/' /etc/ssh/sshd_config
sed -i '$a ChallengeResponseAuthentication yes'  /etc/ssh/sshd_config
sed -i '$a AuthenticationMethods publickey,keyboard-interactive'  /etc/ssh/sshd_config
sed -i '$a sshd-kbdint   auth required           /usr/local/lib/security/pam_google_authenticator.so' /etc/pam.conf

