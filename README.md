# Vagrant boxes for testing Capitomcat

http://capitomcat.sunggun.me

https://wiki.jenkins-ci.org/display/JENKINS/Capitomcat+Plugin

## Tested Capitomcat version
### Last test date : 1/18/2015
- Capitomcat Jenkins plugin 0.0.9
 - Capitomcat 1.1.4 (A Capistrano recipe which is dependency of Capitomcat Jenkins plugin)
 - Capistrano 3.1.0
 

## Tested OS and test result
### Test cases
- Default test
- PTY Option

### Test Result

OS name and version|Test result|`PTY option` that pass the test| Desc |Vagrant Box 
---|---|---|---|---
CentOS 5.6 x86_64				| PASSED    | TRUE / FALSE| | https://github.com/sunggun-yu/capitomcat-test-vagrant/tree/platform/centos5.6-64 |
CentOS 5.9 x86_64				| PARTIAL   | FALSE | 1. Starting Tomcat script is hang when PTY is TRUE, even though "Default requiretty" is set in sudoers file | https://github.com/sunggun-yu/capitomcat-test-vagrant/tree/platform/centos5.9-64
CentOS 6.5 x86_64				| PARTIAL   | FALSE | Same with CentOS 5.9 | https://github.com/sunggun-yu/capitomcat-test-vagrant/tree/platform/centos6.5-64
CentOS 7.0 x86_64				| PASSED    | TRUE / FALSE |  | https://github.com/sunggun-yu/capitomcat-test-vagrant/tree/platform/centos7.0-64
Oracle Linux 5.9 x86_64			| PARTIAL   | FALSE | Same with CentOS 5.9 | https://github.com/sunggun-yu/capitomcat-test-vagrant/tree/platform/oracle5.9-64
Oracle Linux 6.5 x86_64			| PARTIAL   | FALSE | Same with CentOS 5.9 | https://github.com/sunggun-yu/capitomcat-test-vagrant/tree/platform/oracle6.5-64
Ubuntu Precise 12.04 LTS x86_64	| PASSED    | TRUE / FALSE | | https://github.com/sunggun-yu/capitomcat-test-vagrant/tree/platform/ubuntu12.04-64
Ubuntu Trusty 14.04 LTS x86_64	| PASSED    | TRUE / FALSE | | https://github.com/sunggun-yu/capitomcat-test-vagrant/tree/platform/ubuntu14.04-64
Fedora 19 x86_64				| PASSED    | TRUE / FALSE | | https://github.com/sunggun-yu/capitomcat-test-vagrant/tree/platform/fedora19-64
Fedora 20 x86_64				| PASSED    | TRUE / FALSE | | https://github.com/sunggun-yu/capitomcat-test-vagrant/tree/platform/fedora20-64

## Jenkins Setting
### Main settings
![Main settings](./images/jenkins_capitomcat_main.png "Main settings")

### Advanced settings
![Advanced settings](./images/jenkins_capitomcat_tomcat_server_information.png "Advanced settings")

## Test web application
	https://github.com/sunggun-yu/capitomcat-test-webapp

## Test environment settings
All the test has performed with "Use Context" option in Capitomcat Jenkins plugin.

### Server environment
All the server environment has defined with Chef cookbook in Vagrant file.
#### Tomcat
Item|Value|Desc
---|---|---
Version| 7.0.57 | Current latest (1/18/2015)
Installation| Chef tomcat_latest cookbook | Modified from original cookbook.<br>https://github.com/sunggun-yu/tomcat_latest       |
Tomcat home directory| /opt/tomcat7 | 
Tomcat command | /etc/init.d/tomcat7 |



#### Users and groups

Item|Value|Desc
---|---|---
Tomcat user/group | tomcat:tomcat| Owner of Tomcat
Deployment user/group | jenkins:jenkins | Deployment user can execute the tomcat command. also, It also has all the privilege of tomcat user to upload the war file or modify the context file in tomcat home directory. |


#### Authentication
- Private key file for Jenkins user : `id_rsa_jenkins`

```
-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEAzU1c29j/+rxSzKk/TBuS7NsUxfZlEeDh1IGD+z0ZFx7tw0KP
3mZOmjSfKMQjKacqc6vFpCF33UPgVW68pfY4vZa3k69FWxAM+8bNVWZ/9er4Erj8
5s9vUlBqWWgwO2VaVmhCTo+BPIpcQpNskMqATheMzlsnK6O9iSN9gMbRReU9Nsn3
Cde2TSoLuVA02zBRgxW0iYdmjytLSpQKsJ4g6H0RwqeR/NTOB4tyFKTK1QEvy146
FTZ0IY7EwEXLPKhGR+FVlROFIq2n/4xuCLdbs33047ipkuaQlTfeRdITbEhY8pYd
ElcXDu1Ajn/NG4XbHlnsOs+bp2cVDIFEBVC61wIDAQABAoIBAHhvv9/AxzoiLDif
uOA+9Mw6IU+YoeYBFLoDWJeUWhm0LSr0600+mzHfWNcjaLVQuZit1f3ZHGYTIZE8
qzJ45QRjXEIo+fjXy6YQE/jbbomnU+w31TTZz6ZsQlc8xb6yUHKMKwnHKbuIN2Ne
9Ltj8Czfp9yOoMX7An9m8IMRH0dujB0Z5YHdWcBqeeueVKOid15XvjPgq/dHl/sF
dMmKWYMTq9PfmmlW6sVx0g5ngF/5g7jvlR8mcXXcDyfsnLKdTx/F/n4swaXeaExH
UOjAKNB9wY29wWQKymEKxoJJkqrQQTy2ap7tDJWp0T2dpucqeIP5bqCIOcjYev2G
loxnmaECgYEA9Cwj4UQBSqej2eD4aR0rp+VqzxTVpnEbP605qy+nvFNH9mqpME+r
gVB2w96FeJ4NgLwDgNGSzWMCDpd7DOABPUeocI5v/RWkXg2vWU/Bxn0YKNxJmd9S
ixahMXG88Y+7HC01L81fAhQv27ENtOnqavZLOo0kymiiCbHI+wZYWP8CgYEA1z82
X/PDdYeV0FI/ouy6bMAE3WonizHJ5PNA/c0CrYakx8RSL5jG4ix4NGHtGJtuqJWx
AbFMJu93tAq/31qudGX5EAo55i/0Pwvto83SDhOirwpa3VmNL9TgpJCJR7T6ySty
ARA8BGUChLy+3aG+YpHdRO3MTveqnEYpH3BrhikCgYEA1d8D3oBukTGdd25yp7+B
SaLNl20sZomT0IauiJ9JUM+xrMloQITIOJB+NrpmNmxab3Q/rUnkSDp8xsMwaOqc
q0xk4ZIhzZBzVF6wRI5zsKRJ0SCC52CRMHs13dU+Jmg7AEco2yIMIgoEkW3YD6sE
RYROCI8wtopHxC4RWK8KG4kCgYAYQh2ErtpGcqNluP9HA1r3SqTBt2cBfvj7/pZC
hEpa+CO2B+AjURqI/u4FKUwpS8sq4MP0JuEoOjDJb7S0HWov4BYzwpNH5/uk51k+
7sFPqNLa21XmQGNzEpDGuytdk334EhdlG0lITYH9J7BzFfl47mt7izlNZQgrWJTl
4CueEQKBgF10NP5LqtRvm6/eRJ/8A92EctPVJbce8vYJfM+T32BzgAvBBxAtk0Cf
3b7zFaPEet8OWTqZWsp5WstX6Tmos2zEIVM9zI6pn285OY+pf/UI3gWma9mVzcbW
QqY4O47UZDlJCOYroGuyB3GFjEuITPJiGQKLYCnYKi/V36PqeITL
-----END RSA PRIVATE KEY-----
```

- Public key file for Jenkins user : `id_rsa_jenkins.pub`

```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNTVzb2P/6vFLMqT9MG5Ls2xTF9mUR4OHUgYP7PRkXHu3DQo/eZk6aNJ8oxCMppypzq8WkIXfdQ+BVbryl9ji9lreTr0VbEAz7xs1VZn/16vgSuPzmz29SUGpZaDA7ZVpWaEJOj4E8ilxCk2yQyoBOF4zOWycro72JI32AxtFF5T02yfcJ17ZNKgu5UDTbMFGDFbSJh2aPK0tKlAqwniDofRHCp5H81M4Hi3IUpMrVAS/LXjoVNnQhjsTARcs8qEZH4VWVE4Uiraf/jG4It1uzffTjuKmS5pCVN95F0hNsSFjylh0SVxcO7UCOf80bhdseWew6z5unZxUMgUQFULrX jenkins
```

- `/home/jenkins/.ssh/authorized_keys`

```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNTVzb2P/6vFLMqT9MG5Ls2xTF9mUR4OHUgYP7PRkXHu3DQo/eZk6aNJ8oxCMppypzq8WkIXfdQ+BVbryl9ji9lreTr0VbEAz7xs1VZn/16vgSuPzmz29SUGpZaDA7ZVpWaEJOj4E8ilxCk2yQyoBOF4zOWycro72JI32AxtFF5T02yfcJ17ZNKgu5UDTbMFGDFbSJh2aPK0tKlAqwniDofRHCp5H81M4Hi3IUpMrVAS/LXjoVNnQhjsTARcs8qEZH4VWVE4Uiraf/jG4It1uzffTjuKmS5pCVN95F0hNsSFjylh0SVxcO7UCOf80bhdseWew6z5unZxUMgUQFULrX jenkins

```

#### Sudoers

- `/etc/sudoers.d/capitomcat`

```
jenkins ALL=NOPASSWD:/etc/init.d/tomcat7	# To do "sudo /etc/init.d/tomcat7 stop|start"
jenkins ALL=(tomcat) NOPASSWD:ALL			# To do "sudo -u tomcat [command]"
tomcat ALL=NOPASSWD:/etc/init.d/tomcat7		# Nothing related to actual test workflow
```

- `/etc/sudoers`

```
Defaults      !lecture,tty_tickets,!fqdn

# User privilege specification
root          ALL=(ALL) ALL

vagrant ALL=(ALL) NOPASSWD:ALL

# Members of the group 'sysadmin' may gain root privileges
%sysadmin ALL=(ALL) NOPASSWD:ALL

#includedir /etc/sudoers.d

```

#### WAR file deployment directory
- Directory - `/var/capitomcat`

- Owner - `tomcat:tomcat`



