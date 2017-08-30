# c7repos

Basic CentOS 7 initial setup script - Installs common/base repositories and programs (x86_64 only)

### WHAT

Attempts to installs/create the following repositories configs

#### EPEL - REMi - NGiNX - NODEJS - EL-REPO - MARiADB - DOCKER-CE

and some extra packages for a clean, practical and usable base server system.

Some repos have options that can be enabled in the repo file itself. REMi, as an example, has all PHP versions easily enablable from the repo files. EL-REPO's latest kernel packages, kernel-ml, is also just a digit away from being enabled. YUM can also be run with the extra switche --enablerepo=repo.name, essentially doing the same, as a one-shot type deal. Alot more YUM stuff to be read to whom dares using the awesome 'man' command or by visiting YUM's official webpage at http://yum.baseurl.org

### WHERE

c7repos.sh is available at https://github.com/mathieu-aubin/c7repos and the install script is mirrored using bit.ly at https://bit.ly/c7repos

### HOWTO

From a FRESHLY INSTALLED CentOS 7 server, c7repos.sh can be called as superuser (root) by using any of the following methods:

####  Method 1

  - Executing straight from GitHub or a known mirror.

  Example:

```shell
bash <(curl -skL https://bit.ly/c7repos)
```

####  Method 2

  - Downloading/saving it to a location on the machine.
  - Executing a simple bash call pointing to the file.

  Example:

```shell
wget https://bit.ly/c7repos -O c7repos.sh
bash c7repos.sh
```

### HISTORY

Originally scripted for CentOS 6 by Peggy following a request for a simple os configuration script. From there on, it grew to something a little more actual and practical. (Peggy is a fictitious character)

## CONTRIBUTING

By all means and please, do not hesitate to send comments, ideas and/or pull requests.
