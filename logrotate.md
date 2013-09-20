Logrotate Configuration files
=============================

/usr/sbin/logrotate – The logrotate command

/etc/cron.daily/logrotate – This shell script executes the logrotate command everyday
```
#!/bin/sh
/usr/sbin/logrotate /etc/logrotate.conf
...
```

/etc/logrotate.conf – Global Log rotation configuration file
```
weekly
rotate 4
create
include /etc/logrotate.d
/var/log/wtmp {
...
```

/etc/logrotate.d – When individual packages are installed on the system, they drop the log rotation configuration information in this directory
```
/var/log/yum.log {
    missingok
    notifempty
    size 30k
    yearly
    create 0600 root root
}
```
