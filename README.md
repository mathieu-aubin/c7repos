# _c7repos.sh_

Basic initial *CentOS* 7 setup script.

Installs common/base *CentOS* 7 repositories/programs (___x86_64 ONLY___)

### WHAT

*c7repos.sh* attempts to installs/create the following repositories configurations

##### ___EPEL___ - ___REMi___ - __iUS__ - ___NGiNX___ - ___NODEJS___ - ___EL-REPO___ - ___MARiADB___ - ___DOCKER (CE)___

and some suggested extra packages for a clean, practical and usable base server system. _c7repos.sh_ also defines a bunch of useful system aliases and functions.

Some repositories have options that can be enabled directly in the repo files themselves (located in /etc/yum.repos.d/). _REMi_, per example, contains all _PHP_ versions easily enableable from the repository files. Per example, _EL-REPO_'s latest kernel packages _kernel-ml_, is also just a digit away from being enabled. [_YUM_](http://yum.baseurl.org) can also be run with the extra switch `--enablerepo=repo.name`, essentially doing the same. Alot more [_YUM_](http://yum.baseurl.org) stuff to be read in the manual or by visiting [_YUM_'s Official webpage](http://yum.baseurl.org)

### WHERE

_c7repos.sh_ code repository is hosted on [_GitHub_](https://github.com/mathieu-aubin/c7repos).

The installable script is accessible via the traditionnal [_GitHub_'s raw url](https://raw.githubusercontent.com/mathieu-aubin/c7repos/master/c7repos.sh) and is also 'mirrored' using both short following url providers [_Git.io_](https://git.io/vd7Ye) and [_Bit.ly_](https://bit.ly/c7repos)

### HOWTO

Preferably from a ___FRESHLY iNSTALLED___ *CentOS* 7 server, _c7repos.sh_ can be called as superuser (_root_) using one of the following methods

##### Method #1

   - Executing, as root, from a known mirror.

   Example:

    root@host ~ # bash <(curl -4sLk https://bit.ly/c7repos)

##### Method #2

   - Piping _curl_'s output to _bash_'s input.

   Examples:

    root@host ~ # curl -4sLk https://git.io/vd7Ye | bash -
    user@host ~ $ curl -4sLk https://git.io/vd7Ye | sudo bash -

##### Method #3

   - Downloading/saving it to a location on the machine and executing with _bash_.

   Example:

    root@host ~ # wget https://bit.ly/c7repos -O /tmp/c7repos.sh
    root@host ~ # bash /tmp/c7repos.sh

### HOWTO/iNSTALL NOTE

You **MUST** be superuser (_root_) in order to run _c7repos.sh_ (_sudo_ works as well). Using [_Bit.ly_ mirror](https://bit.ly/c7repos) is just about the same as using [_GitHub_'s raw repository url](https://raw.githubusercontent.com/mathieu-aubin/c7repos/master/c7repos.sh) directly the only difference being that i can potentially monitor the usage at some point and if need be. If you do not want to go thru [_Bit.ly_](https://bit.ly/c7repos) you are free to run directly from either one of _GitHub_'s addresses, [_Git.io_'s short](https://git.io/vd7Ye) or [_GitHub_'s raw](https://raw.githubusercontent.com/mathieu-aubin/c7repos/master/c7repos.sh) url.

[_Bit.ly_ mirror](https://bit.ly/c7repos)
[_GitHub_'s raw url](https://raw.githubusercontent.com/mathieu-aubin/c7repos/master/c7repos.sh)
[_Git.io_'s short url](https://git.io/vd7Ye)

### HiSTORY

Originally coded for *CentOS* 6 by _Peggy_ following a request for a simple server configuration script. From there on and some time later, it grew to something a little more actual and practical. (_Peggy_ is a fictitious character)

### CHANGELOG

A changelog is available (and hopefuly up-to-date) on [_GitHub_](https://git.io/vd5aC)

### CONTRiBUTiNG

By all means and please, do not hesitate to send comments, ideas and/or pull requests. Looking forward for your input.