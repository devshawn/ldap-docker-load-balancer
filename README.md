# ldap-docker-load-balancer
This is a LDAP setup utilizing Docker containers for stress testing for possible use in the dungeon.

## Notes for the multi-master LDAP setup
The Docker Compose file spins up two LDAP servers.

### Useful commands... eventually

```
# Adds a new user on ldap container 1
docker exec ldapdockerloadbalancer_ldap-master-a_1 ldapadd -x -D "cn=admin,dc=example,dc=org" -w test -f /container/service/slapd/assets/test/new-user.ldif -h ldap.example.org

# Should show the new user on ldap container 2
docker exec ldapdockerloadbalancer_ldap-master-b_1 ldapsearch -x -h ldap2.example.org -b dc=example,dc=org -D "cn=admin,dc=example,dc=org" -w test -ZZ
```
