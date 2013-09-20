Logrotate Configuration files
=============================

**1. /usr/sbin/logrotate** – The logrotate command

**2. /etc/logrotate.conf** – Global log rotation configuration file
```
weekly
rotate 4
create
include /etc/logrotate.d
/var/log/wtmp {
...
```

**/etc/cron.daily/logrotate** – The shell script that executes the logrotate command everyday
```
#!/bin/sh
/usr/sbin/logrotate /etc/logrotate.conf
...
```

**3. /etc/logrotate.d** – When individual packages are installed on the system, they drop the log rotation configuration information in this directory
```
/var/log/yum.log {
    missingok
    notifempty
    size 30k
    yearly
    create 0600 root root
}
```

_**Test**_: `logrotate -d -f /etc/logrotate.conf`
