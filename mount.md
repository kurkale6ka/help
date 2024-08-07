# Synopsis
`mount -t type device mount_point`

mount writes what it has done to `/etc/mtab` (unless using `-n`), thus the contents
of this file are very similar to the output of `mount` without options.

# CD/DVD mounting
1. `mount -t iso9660 -o ro /dev/cdrom /mnt`
2. `mount -t iso9660 -o loop,ro matlab.iso /media/cdrom0`
A loop device in Linux is an abstraction that lets you treat a file (our iso
image which is not an actual CD) like a block device

# /etc/fstab
mount `/mydata` looks in `/etc/fstab` (first for mount points then for devices)
```
#                                           0 for swap/remote
#                                           1 for /
#                                           2 otherwise
# <device> <mount> <type> <options> <dump> <fsck>
# UUID=... /home   ext4   rw...     0      2
```

# View all mounted partitions of specific type
`mount -l -t ext4`

# Bind mount points to a new directory (like a temporary symlink)
`mount -B /mydata /mnt # or --bind`

## move a mount point
`mount -M /mydata /mnt/ # or --move`

# Remount the mounted filesystem (in order to change some options)
`mount -o remount,rw /mydata`

# Lazy unmount of a filesystem (after disk operations are done)
`umount /mydata -l`

# List filesystems
- `findmnt`
- `mount`

# See if a directory or file is a mountpoint
`mountpoint directory|file`
