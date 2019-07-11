#!/bin/bash
set -ex

## Uninstall portworx on Ubuntu 16.04 (and probably future versions)
## curl -sSL 'https://gist.githubusercontent.com/koshatul/407c09b2aeff92d2bd59533c4ccec983/raw/uninstall-portworx.sh' | /bin/bash /dev/stdin -- 

set +ex

sudo systemctl stop portworx
sudo systemctl disable portworx
sudo rm -f /etc/systemd/system/portworx*.service

# 2: Unmount oci (if required)
grep -q '/opt/pwx/oci /opt/pwx/oci' /proc/self/mountinfo && sudo umount /opt/pwx/oci

# 3: Remove binary files
sudo rm -fr /opt/pwx

# 4: [OPTIONAL] Remove configuration files. Doing this means UNRECOVERABLE DATA LOSS.
sudo rm -fr /etc/pwx
