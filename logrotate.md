Logrotate Configuration files
=============================

**1. /usr/sbin/logrotate** – The logrotate command which runs from _**/etc/cron.daily/logrotate**_ (see notes)

**2. /etc/logrotate.conf** – Global logrotate configuration file

```
weekly
rotate 4
create
include /etc/logrotate.d
/var/log/wtmp {
...
```
- **/etc/logrotate.d** – Application specific logrotate configuration files

```
/var/log/yum/*.log
/var/log/emerge/*.log
{
    missingok
    notifempty
    size 30k
    yearly
    create 0600 root root
}
```


---

Notes:
------

- _**/etc/cron.daily/logrotate**_

```
#!/bin/sh
/usr/sbin/logrotate /etc/logrotate.conf
...
```
- _**Test with**_: `logrotate -df my_logrotate.conf` - **d** for debug, **f** for file
