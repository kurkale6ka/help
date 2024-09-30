# History manipulations
```sh
yum history
yum history list|package-list|summary # '*pattern*' or id
yum history info id
yum history undo id
```

# List available versions (`apt-cache policy`)
```sh
yum list erlang
yum list --showduplicates erlang
```

# Disable stuff
```sh
yum --disablerepo='pgdg*' history
yum --disableplugin priorities
```

# Which package provides a given command (`rpm -qf =...`)
```sh
yum provides nc
```

# CentOS Vault
```sh
/etc/yum.repos.d/CentOS-Base.repo

baseurl=http://vault.centos.org/6.8/os/$basearch/
baseurl=http://vault.centos.org/6.8/updates/$basearch/
baseurl=http://vault.centos.org/6.8/extras/$basearch/
```
_Note_: also, comment 'mirrorlist' entries out
