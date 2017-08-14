#!/usr/bin/dumb-init /bin/bash
FQDN=${FQDN:-localhost}
mkdir -p /etc/mail
echo $FQDN > /etc/mail/mailname
echo $FQDN > /etc/mailname
echo "Starting $FQDN mailserver"
rm -rf /var/spool/smtpd
dkimproxy.out --conf_file=/opt/dkim.conf --daemonize
smtpd -d -f /opt/smtpd.conf

