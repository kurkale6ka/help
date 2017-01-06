# Logrotate

- logrotate is triggered by cron, usually from `/etc/cron.daily/logrotate`:
  ```sh
  #!/bin/sh
  /usr/sbin/logrotate /etc/logrotate.conf
  ...
  ```

- logrotate then applies configurations from `/etc/logrotate.conf` and `/etc/logrotate.d/*`

- _**Test with**_: `logrotate -df my_logrotate.conf` - **d** for debug, **f** for file

- _**copytruncate vs create**_:
  copytruncate should be used with services like apache that keep files open
  continuously. Such services won't notice the file has been renamed (ex:
  error.log -> error.log.1.gz) and will keep writing to the old file descriptor
  now pointing to error.log.1.gz. copytruncate won't change the file
  descriptor, it will simply copy the contents of the current file to a new
  file (error.log.1.gz) then truncate to 0 the current one and continue to
  write there. If in your prerotate script you stop the service there is no
  point using copytruncate since when the service starts it will open new file
  descriptors (the newly created error.log).

- The size option ignores the hourly, daily, weekly or monthly time options.
  Make sure logrotate runs often enough though! From `/etc/cron.hourly` for
  instance.

- logrotate wrongly sets up `$HOME` to `/` so you are screwed if you use
  `$HOME` in your init scripts
