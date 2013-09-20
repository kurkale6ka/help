Logrotate Configuration files
=============================

1. **/usr/sbin/logrotate** – The logrotate command which runs from **/etc/cron.daily/logrotate**
2. **/etc/logrotate.conf**
Global logrotate configuration file
```
weekly
rotate 4
create
include /etc/logrotate.d
/var/log/wtmp {
...
```
3. **/etc/logrotate.d**
Application specific logrotate configuration files
```
/var/log/yum.log {
    missingok
    notifempty
    size 30k
    yearly
    create 0600 root root
}
```

---

**/etc/cron.daily/logrotate**
```
#!/bin/sh
/usr/sbin/logrotate /etc/logrotate.conf
...
```

_**Test**_: `logrotate -df my_logrotate.conf` - **d** for debug, **f** for file
