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
   compress
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

- _**copytruncate Vs create**_:  
copytruncate should be used with services like apache that keep files open
continuously. Such services won't notice the file has been renamed (ex:
error.log -> error.log.1.gz) and will keep writing to the old file descriptor
now pointing to error.log.1.gz. copytruncate won't change the file descriptor,
it will simply copy the contents of the current file to a new file
(error.log.1.gz) then truncate to 0 the current one and continue to write there.
If in your prerotate script you stop the service there is no point using
copytruncate since when the service starts it will open new file descriptors
(the newly created error.log).
