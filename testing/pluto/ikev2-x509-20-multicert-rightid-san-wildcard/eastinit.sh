/testing/guestbin/swan-prep --x509
certutil -D -n west -d sql:/etc/ipsec.d
# add second identity/cert
#pk12util -W foobar -K '' -d sql:/etc/ipsec.d -i /testing/x509/pkcs12/otherca/othereast.p12
pk12util -W foobar -K '' -d sql:/etc/ipsec.d -i /testing/x509/pkcs12/mainca/north.p12
ipsec start
/testing/pluto/bin/wait-until-pluto-started
ipsec auto --add main-east
ipsec auto --add main-north
echo "initdone"
