#!/bin/bash
# This command changes the PermitRootLogin option from the default of "without-password" to "Yes" to allow OTP authentication of the root user
sed -i 's/^\(PermitRootLogin \).*/\1Yes/' /etc/ssh/sshd_config
# These commands add the required options to allow for verifying using public key AND the OTP password method.
sed -i '$a ChallengeResponseAuthentication yes'  /etc/ssh/sshd_config
sed -i '$a AuthenticationMethods publickey,keyboard-interactive'  /etc/ssh/sshd_config
# This command adds the Google PAM Library to the PAM config list and allows for OTPs using the Google Library
sed -i '$a sshd-kbdint   auth required          /opt/local/lib/security/i386/pam_google_authenticator.so' /etc/pam.conf