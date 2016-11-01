LDAP_CID=ldapdockerloadbalancer_ldap-master-a_1
LDAP2_CID=ldapdockerloadbalancer_ldap-master-b_1

LDAP_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ldapdockerloadbalancer_ldap-master-a_1)
LDAP2_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ldapdockerloadbalancer_ldap-master-b_1)

docker exec $LDAP_CID bash -c "echo $LDAP2_IP ldap2.example.org >> /etc/hosts"
docker exec $LDAP2_CID bash -c "echo $LDAP_IP ldap.example.org >> /etc/hosts"

ldapadd -x -D "cn=admin,dc=example,dc=org" -w test -f /container/service/slapd/assets/test/new-user.ldif -h ldap.example.org -ZZ
