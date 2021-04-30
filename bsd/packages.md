# Select a mirror

`export PKG_PATH=ftp://ftp.icm.edu.pl/pub/OpenBSD/4.8/packages/$(uname -m)/`

or:

## 6.0 and below

```
/etc/pkg.conf
installpath = https://ftp.icm.edu.pl/pub/OpenBSD/6.0/packages/amd64/
or
installpath = ftp://ftp.icm.edu.pl/pub/OpenBSD/4.8/packages/i386/
```

## 6.1 and later

```
/etc/installurl
https://cdn.openbsd.org/pub/OpenBSD
```

# Search
`pkg_info -Q screen`

# Install
`pkg_add screen`
