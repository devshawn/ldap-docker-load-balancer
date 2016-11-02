# ldap-docker-load-balancer

This project contains some useful tools for testing how containerized LDAP servers respond to load in various configurations.

## Available configurations

There are [Docker Compose][compose] files for each of the following configurations:

*   `single`: A standalone OpenLDAP server.
*   `lb-1`: A single OpenLDAP server behind HAProxy.
*   `lb-2`: Two replicating OpenLDAP servers behind HAProxy.

In all configurations, the LDAP server can be accessed at `ldap://<Docker host>:3889` with the username `admin` and the password `admin`. The domain name is `clontarf.umm`.

## Setup

To run a configuration, use `docker-compose`:

    $ docker-compose -f docker-compose-single.yml up -d
    Creating ldapdockerloadbalancer_ldap_1
    $ docker-compose -f docker-compose-single.yml down
    Stopping ldapdockerloadbalancer_ldap_1 ... done
    Removing ldapdockerloadbalancer_ldap_1 ... done
    Removing network ldapdockerloadbalancer_default

## Test plans

So far, there's one [JMeter][jmeter] test plan in the `load-test` folder:

*   `simple.jmx`: Runs an add/modify/search/delete loop 200 times with 5 threads.

Note that the test file ships with `multivac.morris.umn.edu` as the default host. Change as necessary.

[compose]: https://docs.docker.com/compose/
[jmeter]: http://jmeter.apache.org/

