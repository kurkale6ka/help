# commands
```sh
systemctl enable --now ...
systemctl cat ...
systemctl show ...
systemctl is-(active|enabled|failed) [pattern]
systemctl list-units rhel\* # add -a to also show inactive ones
systemctl edit -l (or --full) ...
```

`systemctl daemon-reload`

```
              add e(x)planations
             /
journalctl -xe -u <unit>
              \
               jump to (e)nd
```

# man pages
- systemd.directives
- systemd.service
