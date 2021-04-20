# Select a mirror

`export PKG_PATH=https://mirror.bytemark.co.uk/pub/OpenBSD/4.5/packages/$(uname -m)/`

or:

## 6.0 and below

```
/etc/pkg.conf
installpath = https://ftp.icm.edu.pl/pub/OpenBSD/6.0/packages/amd64/
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
