#!/usr/bin/env bash
#
# c7repos.sh
#
# Copyright © 2017-2022 Mathieu Aubin <mathieu@zeroserieux.com>
#
# Installs common/base CentOS 7 repositories/programs (x86_64 ONLY)
#
# WHAT
# ¯¯¯¯
# Attempts  to installs/create the  following repositories  configs, and
# some suggested (at user's will) extra  packages for a clean, practical
# and usable base server system
#
#         EPEL * REMI * NGINX * NODEJS * EL-REPO * MARIADB
#            DOCKER * IUS * YARN * MIDNIGHT COMMANDER
#
# Some repos  have options that can be enabled in the  repo file itself.
# REMI, as an  example, has all PHP versions  easily enablable from  the
# repo files. EL-REPO's latest kernel  packages, kernel-ml, is also just
# a digit away  from being enabled. YUM can  also be run with  the extra
# switch --enablerepo=repo.name,  essentially doing the  same, as a one-
# shot type deal. Alot more YUM stuff to be read to whom dares using the
# awesome 'man' command or by visiting
#
#       YUM's official webpage --> http://yum.baseurl.org
#
# WHERE
# ¯¯¯¯¯
# c7repos.sh code repository is hosted on GitHub at
#
#       https://github.com/mathieu-aubin/c7repos
#
# The installable script (aka the raw script file) is accessible via the
# traditionnal GitHub's raw url and  is also 'mirrored' using some short
# url providers.
#
#       Git.io --> https://git.io/vd7Ye
#       Git.io --> https://git.io/c7repos-install
#       Bit.ly --> https://bit.ly/c7repos
#
# HOWTO
# ¯¯¯¯¯
# Preferably from a FRESHLY INSTALLED CentOS 7 server, c7repos.sh can be
# called as superuser (root) using one of the following methods:
#
#  Method #1
#  ¯¯¯¯¯¯¯¯¯
#   - Executing straight from a known mirror. Example:
#
#      root@host ~ # bash <(curl -4sLk https://git.io/vd7Ye)
#      root@host ~ # bash <(curl -4sLk https://git.io/c7repos-install)
#      root@host ~ # bash <(curl -4sLk https://bit.ly/c7repos)
#
#  Method #2
#  ¯¯¯¯¯¯¯¯¯
#   - Piping curl's output to bash's input. Examples:
#
#      root@host ~ # curl -4sLko- https://bit.ly/c7repos | bash -
#      user@host ~ $ curl -4skLo- https://git.io/vd7Ye | sudo bash -
#      user@host ~ $ curl -4skLo- https://git.io/c7repos-install | sudo bash -
#
#  Method #3
#  ¯¯¯¯¯¯¯¯¯
#   - Saving it to a location on the machine.
#   - Executing the script with bash. Example:
#
#      root@host ~ # wget https://bit.ly/c7repos -O c7repos.sh
#      root@host ~ # bash c7repos.sh
#
# HOWTO/INSTALL NOTE
# ¯¯¯¯¯¯¯¯¯¯
# You *MUST* be superuser in order to run the this - sudo works as well.
#
# Using  https://bit.ly/c7repos  is the same as using the raw repository
# url directly, the difference being i can potentially monitor the usage
# at some point.
#
# If you do not want to go thru Bit.ly you are free to run directly from
# either one of GitHub's addresses, Git.io's mirror or the raw url.
#
# https://git.io/vd7Ye (git.io mirror/short url)
# https://git.io/c7repos-install (git.io mirror/short url)
# https://raw.githubusercontent.com/mathieu-aubin/c7repos/master/c7repos.sh
#
# HISTORY
# ¯¯¯¯¯¯¯
# Originally coded for C6 by Peggy  <peggy@zeroserieux.com> following  a
# request for a simple C6 config script. From there on, some time later,
# it grew to  something a little more  actual and practical. (Peggy is a
# fictitious character)
#
# KNOWN BUGS
# ¯¯¯¯¯¯¯¯¯¯
# This script is known to cause problems if used BEFORE merging a CentOS
# release into a CloudLinux one. Please be aware of this and use only if
# you are confident in your abilities to cleanup whatever mess resulting
# in using this before converting your instance to CloudLinux.
#
# CHANGELOG
# ¯¯¯¯¯¯¯¯¯
# A changelog is available (and hopefuly up-to-date) on GitHub at
#
#      https://git.io/vd5aC
#
# CONTRIBUTING
# ¯¯¯¯¯¯¯¯¯¯¯¯
# By all means and please, do not hesitate to send comments, ideas and/or
# pull requests.
#

# Define some versions used in the script
#
# NodeJS - Must be a valid version number
#	Reference: https://github.com/nodesource/distributions
# nodejs 18 requires higher glibc 2.2++
NODEJS_VERSION=${NODEJS_VERSION:-17};

# MariaDB - Must be a valid version number
#	Reference: https://mariadb.com/kb/en/library/library-mariadb-releases/
MARIADB_VERSION=${MARIADB_VERSION:-10.7}; # 10.7 is stable as of 2022/04/26

# TODO:
#	- Add a php installer thing
#	- Ask users for their preferred editor to use as EDITOR env variable
#

# PHP - Must be a valid remi repo version
#	Reference: https://blog.remirepo.net/pages/Config-en
PHP_VERSION=${PHP_VERSION:-81};

# Repository URL used to fetch ressources from
REPOURL='https://raw.githubusercontent.com/mathieu-aubin/c7repos/master';
# URL to insert into generated files (old BRAGURL='https://github.com/mathieu-aubin/c7repos')
BRAGURL='https://c7repos.4ce.ca';

# Hides cursor and clears terminal
tput civis; tput clear;

# Resets term upon QUIT/CTRL+C and EXIT signals
trap "read -rsp $'\n\n\033[1;38;5;196m--- USER-ISSUED CTRL+C. PRESS ENTER TO EXIT ---\033[0m\n'; exit 1" SIGINT;
trap 'tput smam; tput sgr0; tput cnorm; source ~/.bash_profile' EXIT;

# Function that displays our header...
function _showHEADER() {
	tput bold && cat <<- "__EOF__"

	    ╔═══════════════════════════════╗
	    ║    https://c7repos.4ce.ca     ║
	    ║       ____                    ║
	    ║      |__  |                   ║
	    ║    ╔═╗ / /                    ║
	    ║    ║  /_/╦═╗╔═╗╔═╗╔═╗╔═╗      ║
	    ║    ╚═╝   ╠╦╝║╣ ╠═╝║ ║╚═╗      ║
	    ║          ╩╚═╚═╝╩  ╚═╝╚═╝.sh   ║
	    ║                               ║
	    ║ Basic CentOS 7 Install Script ║
	    ╚═══════════════════════════════╝

	__EOF__
	tput sgr0; tput civis; sleep 1.75;
}

# Function that displays potential danger situation, with a 'danger' msg, centered.
function _showDANGER() {
	local _dangerMSG _dangerASCII;
	_dangerASCII=$(base64 -id <<< 'G1sxOzM4OzU7MTk2bV9fX19fX19fX19fXyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19fX19fX18bWzBtChtbMTszODs1OzE5Nm0gX19fX19fICBfXyBcX19fX18gX19fX19fX19fX19fX18gX19fX19fX19fX19fX19fICAvG1swbQobWzE7Mzg7NTsxOTZtICBfX19fICAvIC8gLyAgX18gYC9fICBfXyBcXyAgX18gYC8gIF8gXF8gIF9fXy9fICAvG1swbQobWzE7Mzg7NTsxOTZtICAgX18gIC9fLyAvLyAvXy8gL18gIC8gLyAvICAvXy8gLy8gIF9fLyAgLyAgICAvXy8bWzBtChtbMTszODs1OzE5Nm0gICAgL19fX19fLyBcX18sXy8gL18vIC9fL19cX18sIC8gXF9fXy8vXy8gICAgKF8pG1swbQobWzE7Mzg7NTsxOTZtICAgICAgICAgICAgICAgICAgICAgICAgICAvX19fXy8bWzBtChtbNTsxOzM4OzU7MTk2bSAgICAgICAbWzRtUE9URU5USUFMIERBTkdFUhtbMG0=');
	[[ ! ${#@} -eq 0 ]] && { _dangerMSG="${@}"; echo "${_dangerASCII}"; echo -ne "\033[1;38;5;196m" && printf "\n%*s\n" $(((${#_dangerMSG}+50)/2)) "${_dangerMSG}" && echo -e "\033[0m"; }
}

# Function that check all the required things for the script to run
function _preCHECK() {
	 # Check if we run as super-user... else... a quote from Linus Torvalds.
	[[ ${EUID} -ne 0 ]] && >&2 echo '“ You not only have to be a good coder to create a system like Linux, you have to be a sneaky bastard, too. ” -LT' && exit 1;

	# Check if we run a x86_64 architecture, else abort.
	_ARCH_TYPE=$(uname -m);
	[[ "${_ARCH_TYPE}" != "x86_64" ]] && >&2 echo -e "\033[1;38;5;196mERROR\033[0;1m: This system is not x86_64 compatible, aborting.\033[0m" && exit 1;

	# Check if we are using centos at all, else abort.
	[[ ! -f "/etc/centos-release" ]] && >&2 echo -e "\033[1;38;5;196mERROR\033[0;1m: This ain't a CentOS release, aborting.\033[0m" && exit 1;

	# Check if we are using the right centos version for this script, else abort.
	_CVER=$(cat /etc/os-release | grep -Pio 'VERSION_ID="\K[[:digit:]"]');
	[[ "${_CVER}" != "7" ]] && >&2 echo -e "\033[1;38;5;196mERROR\033[0;1m: Incompatible CentOS release version, aborting.\033[0m" && exit 1;
}

# Function to disable SELinux
function _doSELINUX() {
	echo -en "\033[1mDisable SELinux? (required to continue) [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m "; read -er _SEL;
	case "${_SEL}" in
		[nN][oO]|[no])
			>&2 echo -e "\033[1;38;5;196mERROR\033[0;1m: I require SELinux to be disabled to continue, aborting.\033[0m"; exit 1;
			;;
		*)
			echo -e "\033[1mDisabling SELinux...\033[0m";
			setenforce 0 &>/dev/null;
			sed -i 's/\(^SELINUX=\).*/\SELINUX=disabled/' /etc/selinux/config 2>/dev/null;
			sed -i 's/\(^SELINUX=\).*/\SELINUX=disabled/' /etc/sysconfig/selinux 2>/dev/null;
			echo -e "  - \033[32mSELinux disabled\033[0;1m.\033[0m";
			sleep 0.3;
			;;
	esac
	unset _SEL;
}

# Function that imports repo gpg signing keys
function _importGPGKEYS() {
	echo -e "\033[1mImporting repositories GPG keys...\033[0m ";
	rpm --import https://nginx.org/keys/nginx_signing.key; sleep 0.01;
	rpm --import https://rpms.remirepo.net/RPM-GPG-KEY-remi; sleep 0.01;
	rpm --import https://rpms.remirepo.net/RPM-GPG-KEY-remi2022; sleep 0.01
	rpm --import https://yum.mariadb.org/RPM-GPG-KEY-MariaDB; sleep 0.01;
	rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org; sleep 0.01;
	rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7; sleep 0.01;
	rpm --import https://download.docker.com/linux/centos/gpg; sleep 0.01;
	rpm --import https://repo.ius.io/RPM-GPG-KEY-IUS-7; sleep 0.01;
	rpm --import https://raw.githubusercontent.com/wp-cli/builds/gh-pages/wp-cli.pgp; sleep 0.01;
	rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg &>/dev/null; sleep 0.01;
	rpm --import https://download.opensuse.org/repositories/home:/laurentwandrebeck:/mc/CentOS_7/repodata/repomd.xml.key; sleep 0.01;
	echo -e "  - \033[32mGPG keys imported\033[0;1m.\033[0m"; sleep 0.3;
}

# Function to install repos that we want/should/must have
function _installREPOS() {
	echo -e "\033[1mInstalling repository packages for available ones...\033[0m ";
	rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm &>/dev/null; sleep 0.1;
	rpm -Uvh https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm &>/dev/null; sleep 0.1;
	rpm -Uvh https://rpms.remirepo.net/enterprise/remi-release-7.rpm &>/dev/null; sleep 0.1;
	echo -e "  - \033[32mRepository packages installed\033[0;1m.\033[0m"; sleep 0.3;

	echo -e "\033[1mCreating repository files (.repo) for repositories without install packages...\033[0m ";

	# Create the MariaDB repo file
	cat <<- __EOF__ | tee /etc/yum.repos.d/mariadb.repo &>/dev/null;
		# Generated by an awesome script on $(date +"%F %R:%S")
		# Check it out at ${BRAGURL}
		[mariadb]
		name=MariaDB ${MARIADB_VERSION} repository for CentOS \$releasever
		baseurl=https://yum.mariadb.org/${MARIADB_VERSION}/centos\$releasever-amd64
		gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
		gpgcheck=1
		enabled=1
		skip_if_unavailable=1

		[mariadb-source]
		name=MariaDB ${MARIADB_VERSION} Source repository for CentOS \$releasever
		baseurl=https://yum.mariadb.org/${MARIADB_VERSION}/centos\$releasever-amd64/srpms
		gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
		gpgcheck=1
		enabled=0
		skip_if_unavailable=1
	__EOF__
	echo -e "  - \033[32mRepository file for MariaDB ${MARIADB_VERSION} created\033[0;1m.\033[0m"; sleep 0.3;

	# Create the NGINX repo file
	cat <<- __EOF__ | tee /etc/yum.repos.d/nginx.repo &>/dev/null;
		# Generated by an awesome script on $(date +"%F %R:%S")
		# Check it out at ${BRAGURL}
		[nginx-stable]
		name=NGINX stable repository for CentOS \$releasever
		baseurl=https://nginx.org/packages/centos/\$releasever/\$basearch
		gpgkey=https://nginx.org/keys/nginx_signing.key
		skip_if_unavailable=1
		gpgcheck=1
		enabled=1

		[nginx-mainline]
		name=NGINX mainline repository for CentOS \$releasever
		baseurl=https://nginx.org/packages/mainline/centos/\$releasever/\$basearch
		gpgkey=https://nginx.org/keys/nginx_signing.key
		skip_if_unavailable=1
		gpgcheck=1
		enabled=0

		[nginx-source]
		name=NGINX source repository for CentOS \$releasever
		baseurl=https://nginx.org/packages/centos/\$releasever/SRPMS
		gpgkey=https://nginx.org/keys/nginx_signing.key
		skip_if_unavailable=1
		gpgcheck=1
		enabled=0
	__EOF__

	echo -e "  - \033[32mRepository file for NGINX created\033[0;1m.\033[0m"; sleep 0.3;

	# Create the Midnight Commander repo file
	# Thanks to Laurent Wandrebeck for his builds (https://download.opensuse.org/repositories/home:/laurentwandrebeck:/)
	cat <<- __EOF__ | tee /etc/yum.repos.d/midnight-commander.repo &>/dev/null;
		# Generated by an awesome script on $(date +"%F %R:%S")
		# Check it out at ${BRAGURL}
		# Thanks to Laurent Wandrebeck for his builds of Midnight Commander
		# Official source is at https://download.opensuse.org/repositories/home:/laurentwandrebeck:/
		[midnight-commander]
		name=Midnight Commander repository for CentOS \$releasever
		baseurl=https://download.opensuse.org/repositories/home:/laurentwandrebeck:/mc/CentOS_\$releasever
		gpgcheck=1
		gpgkey=https://download.opensuse.org/repositories/home:/laurentwandrebeck:/mc/CentOS_\$releasever/repodata/repomd.xml.key
		enabled=1
		skip_if_unavailable=1
	__EOF__

	echo -e "  - \033[32mRepository file for MIDNIGHT COMMANDER created\033[0;1m.\033[0m"; sleep 0.3;

	# NodeJS
	echo -e "\033[1mInstalling NodeJS repository from official source...\033[0m"; sleep 0.1;
	bash <(curl -4skL https://rpm.nodesource.com/setup_${NODEJS_VERSION}.x) &>/dev/null && \
	2>/dev/null echo 'skip_if_unavailable=1' >> /etc/yum.repos.d/nodesource-el7.repo;
	echo -e "  - \033[32mNodeJS repository installed\033[0;1m.\033[0m"; sleep 0.3;

	# Yarn
	echo -e "\033[1mInstalling Yarn repository from official source...\033[0m"; sleep 0.1;
	echo -e "# Generated by an awesome script on $(date +"%F %R:%S")\n# Check it out at ${BRAGURL}\n#" > /etc/yum.repos.d/yarn.repo;
	curl -4skL https://dl.yarnpkg.com/rpm/yarn.repo >>/etc/yum.repos.d/yarn.repo && \
	2>/dev/null echo 'skip_if_unavailable=1' >> /etc/yum.repos.d/yarn.repo;
	echo -e "  - \033[32mYarn repository installed\033[0;1m.\033[0m"; sleep 0.3;

	# iUS Community
	echo -e "\033[1mInstalling iUS repository from official source...\033[0m"; sleep 0.1;
	bash <(curl -4skL https://setup.ius.io) &>/dev/null && \
	echo -e "  - \033[32miUS repository installed\033[0;1m.\033[0m"; sleep 0.3;

	# DockerCE (disabled by default)
	echo -e "\033[1mInstalling Docker CE repository from official source...\033[0m"; sleep 0.1;
	echo -e "# Generated by an awesome script on $(date +"%F %R:%S")\n# Check it out at ${BRAGURL}\n#" > /etc/yum.repos.d/docker-ce.repo;
	curl -4skL https://download.docker.com/linux/centos/docker-ce.repo | sed -e 's/enabled=1/enabled=0/' >> /etc/yum.repos.d/docker-ce.repo && \
	echo -e "  - \033[32mDocker CE repository installed (disabled by default)\033[0;1m.\033[0m"; sleep 0.3;

	# Removed fasttrack repository enable
	echo -e "\033[1mEnabling repositories...\033[0m"; sleep 0.1;
	for R in {centosplus,elrepo,elrepo-extras,elrepo-kernel,epel,extras,ius,mariadb,midnight-commander,nginx-stable,nodesource,remi,remi-safe,remi-php${PHP_VERSION},yarn}; do
		yum-config-manager --enable ${R} &>/dev/null;
		echo -e "  - \033[32mRepository ${R} enabled\033[0;1m.\033[0m"; sleep 0.3;
	done

	# Fix an issue with epel repo having, sometimes, a higher, newer version of nginx
	# We want to use official repository only
	yum-config-manager --setopt=epel.exclude=nginx* --save &>/dev/null

	# Yum config manager has a tendency to add equal '=' sign as ' = ', that is, using spaces.
	# Get rid of the spaces before and after the equal sign to keep me sane.
	sed -i 's/ = /=/g' /etc/yum.repos.d/*.repo;
}

# Function to edit repo files
function _editREPOS() {
	echo -en "\033[1mManually edit repositories files? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m "; read -er _EDITREPOS;
	case "${_EDITREPOS}" in
		[nN][oO]|[no])
			sleep 0.3;
			;;
		*)
			${EDITOR:-nano} /etc/yum.repos.d/*.repo;
			;;
	esac
	unset _EDITREPOS;
}

# Function to update system packages
function _updateSYSTEM() {
	# Clear/refresh Yum cache
	echo -ne "\033[1mCleaning YUM cache...\033[0m"; sleep 0.1;
	yum clean all &>/dev/null; echo -e "\033[32m DONE\033[0;1m.\033[0m";
	echo -ne "\033[1mGenerating a new cache (please wait)...\033[0m"; sleep 0.1;
	yum makecache &>/dev/null; echo -e "\033[32m DONE\033[0;1m.\033[0m";
	# installing Yum-Axelget
	echo -e "\033[1mInstalling yum-axelget...\033[0m"; sleep 0.1;
	yum -y install --disablerepo=\* --enablerepo=epel yum-axelget &>/dev/null
	echo -e "  - \033[32mPackage installed\033[0;1m.\033[0m"; sleep 0.3;
	# System update
	echo -e "\033[1mInstalling system updates (please wait)...\033[0m"; sleep 0.1;
	yum -y update &>/dev/null;
	echo -e "  - \033[32mSystem update completed\033[0;1m.\033[0m"; sleep 0.3;
	# Compat libs
	echo -e "\033[1mInstalling compatibility package group...\033[0m"; sleep 0.1;
	yum -y groups install "Compatibility Libraries" "Legacy UNIX Compatibility" &>/dev/null;
	echo -e "  - \033[32mCompatibility package group installed\033[0;1m.\033[0m"; sleep 0.3;
}

# Function to fix Yum to only use ipv4
function _fixYUMV6() {
	# This comes from a problem i faced on fedora and c7 with epel throwing garbage at ipv6 requests, making any
	# update attemps unsuccessful... that fucked me good but the guys there fixed it quick after i told them.
	# You do whatever. I rather disable ipv6 for Yum than swear, even for only a few seconds.
	echo -e "\033[1mFixing 'potential' IPv6 problem with some repos...\033[0m"; sleep 0.1;
	cat <<- __EOF__ >> /etc/yum.conf

		# This might not behave as intended, potentially lowering
		# your server's download speeds when updating packages...
		# If you get up here and have noticed many failed updates
		# or abnormally slower speeds than expected when updating
		# please comment the following line
		ip_resolve=4
	__EOF__
	echo -e "  - \033[32mYum 'potential' IPv6 problem fixed\033[0;1m.\033[0m"; sleep 0.3;
}

# Function that adds to Yum default configuration
function _addtoYUMCONF() {
	_fixYUMV6;
	echo -e "\033[1mAdding extra Yum configurations...\033[0m"; sleep 0.1;
	# Modify default options
	sed -i '/keepcache=/s/=.*/=1/' /etc/yum.conf;
	sed -i '/debuglevel=/s/=.*/=4/' /etc/yum.conf;
	sed -i '/installonly_limit=/s/=.*/=3/' /etc/yum.conf;

	cat <<- __EOF__ >> /etc/yum.conf

		# rpmverbosity Debug scriptlet output level. Defaults to 'info'
		# Other options: 'critical', 'emergency', 'error', 'warn', 'debug'
		#rpmverbosity=debug
		rpmverbosity=warn

		# http_caching Determines how upstream HTTP caches are instructed
		# to handle any HTTP downloads that Yum does. This option can take
		# the following values
		#
		#	- 'all' all downloads should be cached
		#	- 'packages' only RPM downloads should be cached (no metadata)
		#	- 'none' no cache at all
		#
		# Defaults to 'all'. Unless you are experiencing caching related
		# issues, the default should be fine. Try at least use 'packages'
		# in order to minimize load on repository/packages servers.
		#http_caching=packages

		deltarpm=1
		deltarpm_percentage=70
		skip_if_unavailable=1
		failovermethod=priority
		clean_requirements_on_remove=0

	__EOF__
}

# Function to update grub2 bootloader
# This handy tool now runs whenever an action to a kernel* package is done to
# ensure your bootloader is updated everytime. Thanks to Yum post actions plugin
# To know more about 'update-grub' you can run it with -h or --help
function _updateGRUB() {
	echo -e "\033[1mGetting 'update-grub' tool...\033[0m"; sleep 0.1;
	mkdir -p ~/{bin,.config} &>/dev/null;
	curl -4skL ${REPOURL}/bin/update-grub -o ~/bin/update-grub;
	chmod +x ~/bin/update-grub &>/dev/null; sleep 0.1;
	echo -e "  - \033[32mGrub-Updater tool installed in ~/bin\033[0;1m. Updating bootloader now.\033[0m\n"; sleep 0.3;
	rm -f /boot/grub2/grubenv; ~/bin/update-grub; echo;
}

# Function to install development group packages and some other dev libs
function _installDEVEL() {
	echo -en "\033[1mInstall development tools package group (plus extra packages)? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m "; read -er _DEVPACK;

	case "${_DEVPACK}" in
		[nN][oO]|[no])
			sleep 0.3;
			;;
		*)
			echo -e "\033[1mInstalling development tools package group...\033[0m"; sleep 0.1;
			yum -y --skip-broken groups install "Development Tools" "Fedora Packager" &>/dev/null;
			yum -y --skip-broken install LibRaw-devel bison-devel boost-devel bzip2-devel c-ares-devel giflib-devel glib2-devel glibc-devel gmp-devel json-glib-devel koji-utils libcurl-devel libcap-devel libevent-devel libexif-devel libjpeg-turbo-devel libpcap-devel libpng12-devel libpng-devel libsodium-devel libstdc++-devel libtiff-devel libyaml-devel ncurses-devel openssl-devel pcre-devel perl-devel python-devel ruby-devel systemd-devel xz-devel zlib-devel nasm yasm-devel bzip2-devel &>/dev/null;
			rpmdev-setuptree &>/dev/null; # Setup the rpm build tree
			echo -e "  - \033[32mDevelopment tools package group installed\033[0;1m.\033[0m"; sleep 0.3;
			;;
	esac
	unset _DEVPACK;
}

# Function to install/enable MariaDB
function _installMARIADB() {
	rpm -q MariaDB-server &>/dev/null;
	if [[ ${?} -ne 0 ]]; then
		_MARIADB_INST=0; echo -en "\033[1mInstall MariaDB server? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m ";
	else
		_MARIADB_INST=1; echo -en "\033[1mMariaDB already installed. Re-install MariaDB server? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m ";
	fi
	read -er _MARIADB;
	case "${_MARIADB}" in
		[nN][oO]|[no])
			sleep 0.3;
			;;
		*)
			[[ ${_MARIADB_INST} -eq 0 ]] && echo -e "\033[1mInstalling MariaDB server...\033[0m" || echo -e "\033[1mRe-installing MariaDB server...\033[0m"; sleep 0.1;
			[[ ${_MARIADB_INST} -eq 0 ]] && yum -y install MariaDB-server MariaDB-client &>/dev/null || yum -y reinstall MariaDB-server MariaDB-client &>/dev/null;
			echo -e "  - \033[32mMariaDB server installed\033[0m.";
			sed -i.c7repos.OLD 's/\[server\]/\[server\]\nbind-address = 127.0.0.1/g' /etc/my.cnf.d/server.cnf; sleep 0.3;
			echo -ne "\033[1mStarting MariaDB server...\033[0m"; sleep 0.1;
			systemctl enable mariadb --now && echo -e "\033[32m MariaDB started\033[0;1m.\033[0m"; sleep 1;

			if [ ${_MARIADB_INST} -eq 0 ]; then
				echo -en "\033[1mWould you like me to set a random SQL root password? [y/\033[0;1;38;5;40mN\033[0;1m]\033[0m "; read -er _SQLPASS;
				case "${_SQLPASS}" in
					[yY][eE][sS]|[yes])
						_RNDPASS=$(tr -cd '[:alnum:]' </dev/urandom|fold -w20|head -1); mysqladmin -u root password ${_RNDPASS};
						echo -e "\033[1mThe newly created and set MariaDB root password is: \033[1;37;41m  ${_RNDPASS}  \033[0m\n"; unset _RNDPASS; sleep 0.3;
						echo -e "\033[1;38;5;196mTAKE NOTE OF IT, IT IS NOT LOGGED ANYWHERE. THIS IS THE ONLY TIME YOU WILL SEE IT.\033[0m"; sleep 0.5;
						echo -e "\033[1;38;5;196mTAKE NOTE OF IT, IT IS NOT LOGGED ANYWHERE. THIS IS THE ONLY TIME YOU WILL SEE IT.\033[0m"; sleep 0.5;
						echo -e "\033[1;38;5;196mTAKE NOTE OF IT, IT IS NOT LOGGED ANYWHERE. THIS IS THE ONLY TIME YOU WILL SEE IT.\033[0m"; sleep 1.5;
						echo -e "\033[1mWhen asked for the SQL root password, enter the previously shown password.\033[0m"; sleep 1.5;
						;;
					*)
						echo -e "\033[1mWhen asked for the SQL root password, if you have not set one yet, just press ENTER.\033[0m"; sleep 1.5;
						;;
				esac
				read -rsp $'\033[1;37;41m PRESS ENTER TO CONTINUE. \033[0m\n';
			fi

			echo -e "\n\033[1;38;5;196;4mIMPORTANT INFORMATIONS:\033[0m\n" ;
			echo -e "\033[1mI will open up MariaDB secure installation in a moment.\033[0m"; sleep 0.5;
			echo -e "\033[1mI have already taken one step to secure MariaDB by setting its listening address\nto 127.0.0.1(localhost) so it's NOT exposed to the outside world.\033[0m"; sleep 1;
			echo -e "\033[1mUnless you know precisely what you are doing, all the answers except the first one\nabout root password should be answered by YES or simply by pressing ENTER.\033[0m"; sleep 1;
			read -rsp $'\033[1;37;41m PRESS ENTER TO CONTINUE. \033[0m\n';
			echo -e "\033[1mStarting MariaDB secure installation...\033[0m"; sleep 0.1;
			mariadb-secure-installation; echo -e "\n  - \033[32m DONE Securing MariaDB\033[0;1m.\033[0m";
			;;
	esac
	unset _MARIADB _MARIADB_INST _SQLPASS _RNDPASS;
}

# Function to install/enable NGINX
function _installNGINX() {
	rpm -q nginx &>/dev/null;
	if [[ ${?} -ne 0 ]]; then
		_NGX_INST=0; echo -en "\033[1mInstall \033[0;32mNGINX\033[0;1m? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m "; read -er _GINX;
	else
		_NGX_INST=1; echo -en "\033[0;32mNGINX\033[0;1m already installed. Re-install? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m "; read -er _GINX;
	fi

	case "${_GINX}" in
		[nN][oO]|[no])
			sleep 0.3;
			;;
		*)
			[[ ${_NGX_INST} -eq 0 ]] && echo -e "\033[1mInstalling \033[0;32mNGINX\033[0;1m...\033[0m" || echo -e "\033[1mRe-installing \033[0;32mNGINX\033[0;1m...\033[0m"; sleep 0.1;
			[[ ${_NGX_INST} -eq 0 ]] && yum -y install nginx &>/dev/null || yum -y reinstall nginx &>/dev/null;
			nginx -t &>/dev/null;
			[[ ${?} -eq 0 ]] && {
				_NGXPID="$(pidof nginx)";
				[[ -z ${_NGXPID} ]] && echo -ne "\033[1mStarting \033[0;32mNGINX\033[0;1m...\033[0m" && sleep 0.1;
				systemctl enable nginx --now &>/dev/null && echo -e "\033[32m NGINX\033[0;1m started.\033[0m" && sleep 1;
			}
			echo -e "  - \033[32mNGINX installed\033[0;1m.\033[0m"; sleep 0.3;
			_NGX_INST=1;
			;;
	esac
	unset _NGXPID _GINX;
}

# Function to install NodeJS/NPM
function _installNODE() {
	rpm -q nodejs &>/dev/null;
	if [[ ${?} -ne 0 ]]; then
		_NODE_INST=0; echo -en "\033[1mInstall NodeJS and update NPM to current version? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m "; read -er _NODENPM;
	else
		_NODE_INST=1; echo -en "\033[1mNodeJS already installed. Re-install and update to current version? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m "; read -er _NODENPM;
	fi

	case "${_NODENPM}" in
		[nN][oO]|[no])
			sleep 0.3;
			;;
		*)
			[[ ${_NODE_INST} -eq 0 ]] && echo -e "\033[1mInstalling NodeJS/NPM...\033[0m" || echo -e "\033[1mRe-installing NodeJS/NPM...\033[0m"; sleep 0.1
			[[ ${_NODE_INST} -eq 0 ]] && yum -y --skip-broken install nodejs npm &>/dev/null || yum -y --skip-broken reinstall nodejs npm &>/dev/null;
			echo -e "  - \033[32mNodeJS installed\033[0;1m.\033[0m"; sleep 0.3;
			echo -e "\033[1mUpgrading NPM to latest/current version...\033[0m"; sleep 0.1;
			# Upgrades npm to latest version
			npm install npm -g --upgrade &>/dev/null;
			echo -e "  - \033[32mNPM upgraded\033[0;1m.\033[0m"; sleep 0.3;
			# Generates npm bash completion file
			echo -e "\033[1mCreating NPM completion file...\033[0m"; sleep 0.1;
			echo -e "# Generated by an awesome script on $(date +"%F %R:%S")\n# Check it out at ${BRAGURL}\n#" >/usr/share/bash-completion/completions/npm 2>/dev/null;
			npm completion | grep -Ev "^$|^#$|^# " >>/usr/share/bash-completion/completions/npm 2>/dev/null;
			echo -e "# Generated by an awesome script on $(date +"%F %R:%S")\n# Check it out at ${BRAGURL}\n#\nunsafe-perm\nsearchlimit=100\nuser-agent='NPM Linux x86_64'" >> ~/.npmrc;
			echo -e "  - \033[32mNPM completion file created\033[0;1m.\033[0m"; sleep 0.3;
			;;
	esac
	unset _NODE_INST _NODENPM;
}

# Function to install the common packages/applications
function _installCOMMON() {
	# Set of commonly used packages and utilities to be installed
	_COMMON_PACKAGES=$(curl -4skL ${REPOURL}/deps/common_packages.txt);

	echo -e "\033[1mInstalling base/common packages...\033[0m"; sleep 0.1;

	# Running this twice should help mitigate the kmod-nvidia issue by installing whatever
	# it can first (with --skip-broken, too), then running it again...
	yum -y --skip-broken --disablerepo=elrepo install ${_COMMON_PACKAGES} &>/dev/null;
	yum -y --skip-broken install ${_COMMON_PACKAGES} &>/dev/null;

	# Adding nano as EDITOR because i like it's simplicity
	export EDITOR=$(which nano);

	# Starting the iptables 'firewall' system
	systemctl enable iptables --now &>/dev/null; systemctl enable ip6tables --now &>/dev/null;

	# "Hack" to silence parallel's bibtex thing - Make sure you cite the following publication
	# https://www.bibsonomy.org/bibtex/2ab8ea12a0dffc7a4f4d5e972c8fb4ad8/fezett
	mkdir -p ~/.parallel && touch ~/.parallel/will-cite;
	# Go as far as apply the hack to every new users created
	mkdir -p /etc/skel/.parallel && touch /etc/skel/.parallel/will-cite;

	# Creates wp-cli bash-completion file
	cat <<- __EOF__ >/usr/share/bash-completion/completions/wp-cli &>/dev/null;
		# wp-cli bash completion file, generated by an awesome script on $(date +"%F %R:%S")
		# Check it out at ${BRAGURL}
		_wp_complete() {
		  local OLD_IFS="\$IFS"; local cur=\${COMP_WORDS[COMP_CWORD]}
		  IFS=\$'\n'; local opts="\$(wp cli completions --line="\$COMP_LINE" --point="\$COMP_POINT")";
		 if [[ "\$opts" =~ \<file\>\s* ]]; then
		  COMPREPLY=(\$(compgen -f -- \$cur))
		 elif [[ \$opts = "" ]]; then
		  COMPREPLY=(\$(compgen -f -- \$cur))
		 else
		  COMPREPLY=(\${opts[*]})
		 fi
		  IFS="\$OLD_IFS"; return 0
		}
		complete -o nospace -F _wp_complete wp wp-cli
	__EOF__

	# Perform python2-pip commands if installed
	rpm -q python2-pip &>/dev/null;
	[[ ${?} -eq 0 ]] && {
		echo -e "\033[1mUpgrading and creating python PIP completion file...\033[0m"; sleep 0.1;
		# Upgrades pip to latest version
		pip install pip --upgrade &>/dev/null;
		# Generates pip completion file
		echo -e "# Generated by an awesome script on $(date +"%F %R:%S")\n# Check it out at ${BRAGURL}\n#" >/usr/share/bash-completion/completions/pip 2>/dev/null;
		pip completion --bash | grep -Ev "^$" >>/usr/share/bash-completion/completions/pip 2>/dev/null;
		echo -e "  - \033[32mPython PIP completion file created\033[0;1m.\033[0m"; sleep 0.3;
		# Install speedtest-cli (https://github.com/sivel/speedtest-cli) and pyftpdlib (https://github.com/giampaolo/pyftpdlib)
		pip install speedtest-cli pyftpdlib &>/dev/null;
	}

	# Install some npm utils if installed
	hash npm &>/dev/null;
	[[ ${?} -eq 0 ]] && {
		npm install serve http-server xtinypng-cli webpagetest -g &>/dev/null;
	}

	echo -e "  - \033[32mBase/common packages installed\033[0m."; sleep 0.3;
}

# Function to create our dotfiles
function _createDOTFILES() {
	# Append some stuff to .bashrc and skeleton for new users
	echo -e "\033[1mAppending to ~/.bashrc and /etc/skel/.bashrc...\033[0m"; sleep 0.1;

	# Apply modifications to both ~/.bashrc and /etc/skel/.bashrc
	for BASHRCFILE in ~/.bashrc /etc/skel/.bashrc; do
		#echo -e "\nexport HISTIGNORE='&:exit:x:l:history:editenv:[h ]*:[ \\\t]*:?:??:w -i:pwd:srcalias*:srcexports*:srcfunctions*:srccolors*:srcdot*:env:quit:popd*:ginx*:chownwww*:yum clean*:yum makecache*'" >> ${BASHRCFILE};

		# Make sure we only have the source line once (if script is run multiple times per example)
		sed -i '/not excluded by/d' ${BASHRCFILE}; sed -i '/for DFs in/d' ${BASHRCFILE};
		# Commands to source files
		echo -e "\n# Source ~/.bash_* files not excluded by the grep command" >> ${BASHRCFILE};
		echo 'for DFs in $(ls -1p ~/.bash_* | \grep -Ev "save$|old|back|bak$|~$|history|logout|profile|/$"); do source ${DFs}; done; unset DFs;' >> ${BASHRCFILE};

		# Bash completion files
		echo "# Source the completion files needed for bash completion to work" >> ${BASHRCFILE};
		echo "[[ -f /etc/bash_completion ]] && source /etc/bash_completion" >> ${BASHRCFILE};
		echo "[[ -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion" >> ${BASHRCFILE};

		# Perlbrew source file, added if Perlbrew has been previously installed
		[[ ${_PBREW_INST} -eq 1 ]] && echo -e "[[ -f ~/perl5/perlbrew/etc/bashrc ]] && source ~/perl5/perlbrew/etc/bashrc\n" >> ${BASHRCFILE};

	done
	unset BASHRCFILE;

	# Creates the functions file
	echo -e "\033[1mCreating bash functions file...\033[0m"; sleep 0.1;
	echo -e "# .bash_functions - Functions file added by an awesome script on $(date +"%F %R:%S")\n# Check it out at ${BRAGURL}\n#" > ~/.bash_functions;
	# Get the functions raw files from the repo
	_TMPFILE=$(mktemp -t c7rf.XXXXXXXXXX);
	curl -4skL ${REPOURL}/deps/functions_list.txt >${_TMPFILE};
	while read _FSRC; do
		curl -4skL ${REPOURL}/functions/${_FSRC} >> ~/.bash_functions;
		echo '' >> ~/.bash_functions;
	done < ${_TMPFILE}
	[[ -f ${_TMPFILE} ]] && rm -f ${_TMPFILE};
	echo -e "  - \033[32mFunctions file created\033[0;1m.\033[0m"; sleep 0.2;
	unset _TMPFILE;

	# Creates the aliases file
	echo -e "\033[1mCreating bash aliases file...\033[0m"; sleep 0.1;
	echo -e "# .bash_aliases - Aliases file created by an awesome script on $(date +"%F %R:%S")\n# Check it out at ${BRAGURL}\n#" > ~/.bash_aliases;
	curl -4skL ${REPOURL}/aliases/bash_aliases >> ~/.bash_aliases;
	echo -e "  - \033[32mAliases file created\033[0;1m.\033[0m"; sleep 0.2;

	# Creates the export file
	echo -e "# .bash_exports - Export file created by an awesome script on $(date +"%F %R:%S")\n# Check it out at ${BRAGURL}\n#" > ~/.bash_exports;
	echo -e "\033[1mAdding a random colored PS1 to export file...\033[0m"; sleep 0.1;
	_C1=$(shuf -n1 -i 21-231); _C2=$(shuf -n1 -i 21-231); _C3=$(shuf -n1 -i 21-231);
	_RNDPS1="\[\033[1m\][\[\033[1;38;5;${_C1}m\]\u\[\033[0m\]@\[\033[1;38;5;${_C2}m\]\H\[\033[0;1m\]] \[\033[1;38;5;${_C3}m\]\w\[\033[0;1m\] \\$\[\033[0m\] "
	echo -e "export PS1=\"${_RNDPS1}\";" >> ~/.bash_exports;
	echo -e '  - \033[32mRandom colored PS1 added to exports\033[0m'; sleep 0.3;
	unset _C1 _C2 _C3;

	# Writes general export values to export file
	cat <<- "__EOF__" >> ~/.bash_exports
		shopt -s checkwinsize; shopt -s histappend;
		shopt -s globstar; shopt -s dotglob;
		shopt -s autocd;
		export HISTCONTROL=ignoreboth:erasedups;
		export HISTSIZE=20000;
		export HISTFILESIZE=-1;
		export HISTTIMEFORMAT='%Y/%m/%d %T ';
		export EDITOR=$(which nano);
		export VISUAL=${EDITOR};
		# To get rid of systemd pager
		export SYSTEMD_PAGER=;

		# Source tinykeys to get a new API code to use with 'xtinypng' every login
		# More informations at https://ghub.io/xtinypng-cli (thanks ghub.io)
		# DO NOT ENABLE IF YOU HAVE NOT RUN tinykeys ONCE TO SET YOUR PASSWORD FIRST
		#[[ -x $(which tinykeys) ]] && source $(tinykeys --env);

	__EOF__
	echo -e '  - \033[32mAdded general exports\033[0m'; sleep 0.3;

	# Check if golang was installed
	if [[ ${_GOLANG_INST} -eq 1 ]]; then
		# Writes golang env variables to export file
		cat <<- "__EOF__" >> ~/.bash_exports
			# Golang env variables (more infos: go env / go help environment)
			export GOOS=linux;
			export GOPATH=~/go;
			export GOARCH=amd64;
			export GOROOT=/opt/go;
			export CGO_ENABLED=0;
			export GO111MODULE=off;
			export GOBIN=${GOPATH}/bin;
			export GOTOOLDIR=${GOROOT}/pkg/tool/${GOOS}_${GOARCH};

			export PATH="${GOROOT}/bin:${GOBIN}:${PATH}";

		__EOF__
		echo -e '  - \033[32mAdded Golang exports\033[0m'; sleep 0.3;
	fi

}

# Function to check for current running ssh port - Might have some issues with proper detection
function _checkSSH() {
	# Checking the ssh server port, relying on which port user currently is connected on
	if [[ ${SSH_CLIENT##* } -eq 22 ]]; then
		_showDANGER "SSH IS RUNNING ON PORT 22";
		echo -en "\033[1mShould we change SSH port NOW? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m "; read -er _SSHP;
		case "${_SSHP}" in
			[nN][oO]|[no])
				_showDANGER "SSH PORT UNCHANGED AND STILL ON 22"; sleep 2;
				;;
			*)
				echo -en "\033[1mChange SSH to which port (integers only)? \033[0m"; read -er _SSHPC; _SSHPC=${_SSHPC##*[!0-9]*};
				if ! [[ -z ${_SSHPC} || ${_SSHPC} -eq 22 ]]; then
					# Replace the port line by commenting it and adding new port infos
					sed -i "s/^\(Port 22\)$/# Original port was 22\nPort ${_SSHPC}/" /etc/ssh/sshd_config;
					sed -i "s/^\(#Port 22\)$/# Original port was 22\nPort ${_SSHPC}/" /etc/ssh/sshd_config;
					# Dont take any chances and add port to selinux policy
					[[ $(command -v semanage) ]] && semanage port -a -t ssh_port_t -p tcp ${_SSHPC} &>/dev/null;
					# Adds AcceptEnv line to accept history env variables
					sed -i 's/\(XMODIFIERS\)$/\1\n\n# Accept history-related environment variables\nAcceptEnv HISTFILE HISTIGNORE HISTCONTROL/' /etc/ssh/sshd_config;
					systemctl restart sshd; unset SSH_CLIENT;
					# Fix BOTH iptables default files with new port
					yum -y install iptables ip6tables iptables-services &>/dev/null;
					[[ -f /etc/sysconfig/ip6tables ]] && sed -i "s/--dport 22 /--dport ${_SSHPC} /" /etc/sysconfig/ip6tables;
					[[ -f /etc/sysconfig/iptables ]] && sed -i "s/--dport 22 /--dport ${_SSHPC} /" /etc/sysconfig/iptables;
					# Since i hate firewalld, disable it and use straight iptables instead
					systemctl disable firewalld --now &>/dev/null;
					systemctl enable iptables ip6tables --now &>/dev/null;
					systemctl restart iptables &>/dev/null;
					echo -e "  - \033[32mSSH port changed\033[0;1m.\033[0m"; sleep 0.3;
					echo -e "\n\033[1;38;5;196;4mMAKE SURE YOU REMEMBER IT AS IT IS IN EFFECT NOW.\033[0m"; sleep 2;
					echo -e "\033[1;38;5;196;4mMAKE SURE YOU REMEMBER IT AS IT IS IN EFFECT NOW.\033[0m\n"; sleep 1;
				else
					_showDANGER "BAD INPUT. SSH IS STILL RUNNING ON PORT 22"; sleep 2;
				fi
				unset _SSHPC;
				;;
		esac
		unset _SSHP;
	fi
}

# Function to install nano (v2.9.4) from rpm, built for c7repos
function _installNANO() {
	echo -e "\033[1mInstalling nano-editor v2.9.4...\033[0m"; sleep 0.1;
	rpm -Uvh ${REPOURL}/rpms/nano-2.9.4-1.c7repos.x86_64.rpm &>/dev/null;
}

# Function that creates getaddrinfo configuration (favors ipv4 vs ipv6)
function _createGAICONF() {
	echo -e "\033[1mCreating getaddrinfo (GAI) config...\033[0m"; sleep 0.1;
	if [[ -f /etc/gai.conf ]]; then
		echo -e "  - \033[32mGAI config file \033[0;1m/etc/gai.conf\033[0;32m already exist, skipping\033[0;1m.\033[0m"; sleep 0.3;
	else
		# Get gai.conf from the repo
		curl -4skL ${REPOURL}/deps/gai.conf >/etc/gai.conf;
		chmod 644 /etc/gai.conf &>/dev/null;
		echo -e "  - \033[32mGAI config file \033[0;1m/etc/gai.conf\033[0;32m created\033[0;1m.\033[0m"; sleep 0.3;
	fi
}

# Function that installs Yum-utils/fastestmirror/deltarpm
function _installYUMSTUFF() {
	echo -e "\033[1mInstalling yum-utils/fastestmirror/deltarpm,post-actions...\033[0m"; sleep 0.1;
	yum --disablerepo=\* --enablerepo=base install yum-utils yum-plugin-fastestmirror yum-plugin-post-transaction-actions deltarpm -y &>/dev/null &&
	echo -e "  - \033[32mYum stuff installed\033[0;1m.\033[0m"; sleep 0.3;
}

# Function to install Perlbrew (https://github.com/gugod/App-perlbrew)
function _installPERLBREW() {
	echo -en "\033[1mInstall Perlbrew? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m "; read -er _PERLB;

	case "${_PERLB}" in
		[nN][oO]|[no])
			sleep 0.3;
			;;
		*)
			echo -e "\033[1mInstalling Perlbrew...\033[0m"; sleep 0.1;
			# Installs Perlbrew from the Git.io redirect url
			bash <(curl -4sLk https://git.io/perlbrew-install) &>/dev/null
			if [[ -e ~/perl5/perlbrew/etc/bashrc ]]; then
				_PBREW_INST=1;
				source ~/perl5/perlbrew/etc/bashrc &>/dev/null;
				perlbrew init &>/dev/null; sleep 1;
				echo -e 'y\n'|perlbrew install-cpanm &>/dev/null;
				echo -e 'y\n'|perlbrew install-patchperl &>/dev/null;
				# Creates Perlbrew bash-completion file
				echo -e "# Perlbrew bash completion file, generated by an awesome script on $(date +"%F %R:%S")\n# Check it out at ${BRAGURL}\n#" >/usr/share/bash-completion/completions/perlbrew;
				curl -4skL https://git.io/perlbrew-completion >>/usr/share/bash-completion/completions/perlbrew 2>/dev/null;
				echo -e "  - \033[32mPerlbrew installed\033[0;1m.\033[0m"; sleep 0.3;
			else
				echo -e "  - \033[1;38;5;196;4mPerlbrew installation problem... \033[0;1mskipped.\033[0m"; sleep 2;
			fi
			;;
	esac
	unset _PERLB;
}

# Function to install latest Golang from src (https://golang.org/doc/)
function _installGOLANG() {
	echo -en "\033[1mInstall Golang? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m "; read -er _GOLNG;

	case "${_GOLNG}" in
		[nN][oO]|[no])
			sleep 0.3;
			;;
		*)
			_GOVER=$(curl -4skL 'https://golang.org/VERSION?m=text');
			mkdir -p /opt/go;
			echo -e "\033[1mInstalling Golang version ${_GOVER##*go}...\033[0m"; sleep 0.1;
			curl -4sLk https://dl.google.com/go/${_GOVER}.linux-amd64.tar.gz | tar --strip-components=1 -xzC /opt/go &>/dev/null
			if [[ -x /opt/go/bin/go ]]; then
				_GOLANG_INST=1;
				# Allows for using 'getgo' to update - https://go.googlesource.com/tools/+/master/cmd/getgo/
				ln -s /opt/go ~/.go; mkdir -p ~/go/{bin,src,pkg};
				echo -e "  - \033[32mGolang installed\033[0;1m.\033[0m"; sleep 0.3;
			else
				echo -e "  - \033[1;38;5;196;4mGolang installation problem... \033[0;1mskipped.\033[0m"; sleep 2;
			fi
			;;
	esac
	unset _GOLNG _GOVER;
}

# Function to create a ssh key/pair
function _createSSHKEYS() {
	if [[ ! -f ~/.ssh/id_rsa || ! -f ~/.ssh/id_rsa.pub ]]; then
		echo -en "\033[1mCreate a new ssh key pair? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m "; read -er _SSHP;

		case "${_SSHP}" in
			[nN][oO]|[no])
				sleep 0.3;
				;;
			*)
			# Create the .ssh dir for both current and future users
			mkdir -p ~/.ssh /etc/skel/.ssh;
			ssh-keygen -f ~/.ssh/id_rsa -t rsa -N '';
			# Once our key is created, add it as allowed for new users skeleton
			touch /etc/skel/.ssh/authorized_keys && cat ~/.ssh/id_rsa.pub >>/etc/skel/.ssh/authorized_keys;
			;;
		esac
	fi
	unset _SSHP;
}

# Function to cheat gnu parallel into thinking we have read the citation (sorry)
# Also applies it to new users via skeleton files at /etc/skel
function _cheatPARALLEL() {
	mkdir -p ~/.parallel && touch ~/.parallel/will-cite;
	mkdir -p /etc/skel/.parallel && touch /etc/skel/.parallel/will-cite;
}

# Function to add support for some filetypes for command-line coloring (webp for now)
function _addCOLORS() {
	echo -e "\033[1mAdding support for WEBP file coloring to DIR_COLORS files...\033[0m"; sleep 0.1;
	# Remove any previous webp declaration to avoid duplicates
	sed -i '/^.webp/d' /etc/DIR_COLORS /etc/DIR_COLORS.256color /etc/DIR_COLORS.lightbgcolor;
	echo -e '\n# Support for WEBP images\n.webp 01;35\n' >> /etc/DIR_COLORS
	echo -e '\n# Support for WEBP images\n.webp 38;5;13\n' >> /etc/DIR_COLORS.256color
	echo -e '\n# Support for WEBP images\n.webp 00;35\n' >> /etc/DIR_COLORS.lightbgcolor
	echo -e "  - \033[32mDIR_COLORS files modified\033[0;1m.\033[0m"; sleep 0.3;
}

# Function to create a yum post install/update/remove action on all kernel-related packages
function _createYUMPOST() {
	cat <<- __EOF__ >/etc/yum/post-actions/kernel.action
		# This runs update-grub after any kernel modification (install, update, remove).
		# If 'update-grub' cannot be found in the typical c7repos location, directly run
		# the command as in 'rm -f /boot/grub2/grubenv; grub2-mkconfig -o /boot/grub2/grub.cfg'
		kernel*:any:>&2 echo; if [ -x /root/bin/update-grub ]; then >&2 /root/bin/update-grub; elif [ -x /usr/sbin/grub2-mkconfig ]; then rm -f /boot/grub2/grubenv; /usr/sbin/grub2-mkconfig -o /boot/grub2/grub.cfg; fi; >&2 echo;
	__EOF__
}

# Function that sets the hostname according to user input
# I don't care if the user sets a bad hostname, he should be
# more careful next time as i don't want to manage that input
function _setHOSTNAME() {
	echo -en "\033[1mSet a HOSTNAME for this server? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m "; read -er _HSTNM;

	case "${_HSTNM}" in
		[nN][oO]|[no])
			sleep 0.3;
			;;
		*)
			read -rp $"Please enter the HOSTNAME you want for this server: " _HOSTNAME;
			if [[ -n "${_HOSTNAME}" ]]; then
				hostnamectl set-hostname "${_HOSTNAME}";
				echo -e "  - \033[32mHOSTNAME set to '${_HOSTNAME}'\033[0;1m.\033[0m"; sleep 0.3;
			else
				echo -e "  - \033[1;38;5;196;4mThe hostname cannot be null... \033[0;1mAborting.\033[0m"; sleep 2;
			fi
			;;
	esac
	unset _HSTNM _HOSTNAME;
}

# Function to add cloudflare/google's resolvers to resolv.conf file.
# It also very basically backups the original data by commenting it.
function _modifyRESOLVCONF() {
	echo -en "\033[1mModify resolv.conf to add 1.1.1.1/google's resolvers? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m "; read -er _MRESOLV;

	case "${_MRESOLV}" in
		[nN][oO]|[no])
			sleep 0.3;
			;;
		*)
			echo -e "\033[1mAdding 1.1.1.1/google's resolvers to resolv.conf...\033[0m"; sleep 0.1;
			_TMPFILE=$(mktemp -t c7rf.XXXXXXXXXX);
			sed -i '/generated /d' /etc/resolv.conf; sed -i '/it out /d' /etc/resolv.conf; sed -i '/^#$/d' /etc/resolv.conf;
			echo -e "# resolv.conf generated by an awesome script on $(date +"%F %R:%S")\n# Check it out at ${BRAGURL}\n#" > ${_TMPFILE};
			while read _ORSLV; do
				echo "#${_ORSLV}" >> ${_TMPFILE};
			done < /etc/resolv.conf;
			echo -e "#\nnameserver 1.1.1.1\nnameserver 1.0.0.1\nnameserver 8.8.4.4\noptions rotate\n#search yourdomain.com" >> ${_TMPFILE};
			cat ${_TMPFILE} > /etc/resolv.conf;
			[[ -f ${_TMPFILE} ]] && rm -f ${_TMPFILE};
			echo -e "  - \033[32mresolv.conf modified\033[0;1m.\033[0m"; sleep 0.3;
			;;
	esac
	unset _MRESOLV _TMPFILE _ORSLV;
}

# Call to show our header
_showHEADER;

# Call to check if all is correct to run the script...
_preCHECK;

# Call to the disable SELinux function
_doSELINUX;

# Call to check SSH port and change if needed/wanted
_checkSSH;

# Call to create getaddressinfo config which favors ipv4
_createGAICONF;

# Call to modify resolv.conf adding CF/GOOGLE nameservers
_modifyRESOLVCONF;

# Call to set a HOSTNAME for the server/instance
_setHOSTNAME;

# Call to create ssh key pair
_createSSHKEYS;

# Call to install Yum-utils/fastestmirror/deltapm/yum-plugin-post-transaction-actions
_installYUMSTUFF;

# Call to set Yum post install actions (essentially for kernel packages manipulations)
_createYUMPOST;

# Call to update bootloader config after any yum kernel modifications
_updateGRUB;

# Call to import the repo gpg keys
_importGPGKEYS;

# Call to install/create known repos files
_installREPOS;

# Call to install nano
_installNANO;

# Call to edit repo files
_editREPOS;

# Call to add some extra Yum configs
_addtoYUMCONF;

# Call to update system packages
_updateSYSTEM;

# Call to install devel packages
_installDEVEL;

# Call to install MariaDB
_installMARIADB;

# Call to install NGINX
_installNGINX;

# Call to install NODEJS
_installNODE;

# Call to install common packages
_installCOMMON;

# Call to install PERLBREW
_installPERLBREW;

# Call to install GOLANG
_installGOLANG;

# Call to create aliase and function
_createDOTFILES;

# Call to add to DIR_COLORS* files
_addCOLORS; # Adds webp support

# Call to cheat parallel citation (sorry)
_cheatPARALLEL;

sleep 2; clear;
echo -e "\n\033[1mDone with this CentOS 7 auto install script.\033[0m";
echo -e "\033[1mConsider checking your firewall, SSH configs and the likes.\033[0m";
echo -e "\033[1mAlso, a reboot wouldn't hurt, after initial install...\033[0m\n";
echo -e "\033[1mHave a nice day.\033[0m\n";
sleep 5;

# Ensure a definite exit code in order for the initially set trap
# to be executed - Essentially, to source ~/.bash_profile at exit
exit 0;