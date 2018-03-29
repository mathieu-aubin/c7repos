#!/usr/bin/env bash
#
# c7repos.sh
#
# Copyright © 2017-2018 Mathieu Aubin <mathieu@zeroserieux.com>
#
# Installs common/base CentOS7 repositories/programs (x86_64 ONLY)
#
# WHAT
# ¯¯¯¯
# Attempts  to installs/create the  following repositories  configs, and
# some suggested (at user's will) extra  packages for a clean, practical
# and usable base server system
#
#  EPEL * REMi * NGiNX * NODEJS * EL-REPO * MARiADB * DOCKER(CE) * IUS
#
# Some repos  have options that can be enabled in the  repo file itself.
# REMi, as an  example, has all PHP versions  easily enablable from  the
# repo files. EL-REPO's latest kernel  packages, kernel-ml, is also just
# a digit away  from being enabled. YUM can  also be run with  the extra
# switch --enablerepo=repo.name,  essentially doing the  same, as a one-
# shot type deal. Alot more YUM stuff to be read to whom dares using the
# awesome 'man' command or by visiting
#
#      YUM's official webpage --> http://yum.baseurl.org
#
# WHERE
# ¯¯¯¯¯
# c7repos.sh code repository is hosted on GitHub at
#
#      https://github.com/mathieu-aubin/c7repos
#
# The installable script (aka the raw script file) is accessible via the
# traditionnal GitHub's raw url and  is also 'mirrored' using both short
# url providers.
#
#      Git.io --> https://git.io/vd7Ye
#      Bit.ly --> https://bit.ly/c7repos
#
# HOWTO
# ¯¯¯¯¯
# Preferably from a FRESHLY iNSTALLED CentOS 7 server, c7repos.sh can be
# called as superuser (root) using one of the following methods:
#
#  Method #1
#  ¯¯¯¯¯¯¯¯¯
#   - Executing straight from a known mirror. Example:
#
#      root@host ~ # bash <(curl -skL https://bit.ly/c7repos)
#
#  Method #2
#  ¯¯¯¯¯¯¯¯¯
#   - Piping curl's output to bash's input. Examples:
#
#      root@host ~ # curl -skL https://git.io/vd7Ye | bash -
#    nobody@host ~ $ curl -skL https://git.io/vd7Ye | sudo bash -
#
#  Method #3
#  ¯¯¯¯¯¯¯¯¯
#   - Saving it to a location on the machine.
#   - Executing the script with bash. Example:
#
#      root@host ~ # wget https://bit.ly/c7repos -O c7repos.sh
#      root@host ~ # bash c7repos.sh
#
# HOWTO NOTE
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
# https://raw.githubusercontent.com/mathieu-aubin/c7repos/master/c7repos.sh
#
# HISTORY
# ¯¯¯¯¯¯¯
# Originally coded for C6 by Peggy  <peggy@zeroserieux.com> following  a
# request for a simple C6 config script. From there on, some time later,
# it grew to  something a little more  actual and practical. (Peggy is a
# fictitious character)
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
# pull requests. Looking forward for your input.
#

# Defines some versions used in the script
MARIADBVER=10.3 ; NODEJSVER=9 ;

# Repository URL used to fetch ressources
REPOURL='https://raw.githubusercontent.com/mathieu-aubin/c7repos/master' ;
# URL to insert into generated files
BRAGURL='https://github.com/mathieu-aubin/c7repos' ;

# Hides cursor and clears terminal
tput civis ; tput clear ;

# Resets term upon QUIT/CTRL+C and EXIT signals
trap "read -rsp $'\n\n\033[1;38;5;196m-- USER-iSSUED CTRL+C. PRESS ENTER TO EXiT --\033[0m\n'; exit 1" SIGINT ;
trap 'tput smam; tput sgr0; tput cnorm' EXIT ;

# Function that displays our header...
_showHEADER() {
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
	tput sgr0 ; tput civis ; sleep 1.75 ;
}

# Function that displays potential danger situation, with a danger msg centered.
_showDANGER() {
  local _dangerMSG=${1:-POTENTIAL DANGER};
  echo -e "\n\033[1;38;5;196m____________                                ________\033[0m" ;
  echo -e "\033[1;38;5;196m ______  __ \_____ ______________ _______________  /\033[0m" ;
  echo -e "\033[1;38;5;196m  ____  / / /  __ \`/_  __ \_  __ \`/  _ \_  ___/_  /\033[0m" ;
  echo -e "\033[1;38;5;196m   __  /_/ // /_/ /_  / / /  /_/ //  __/  /    /_/\033[0m" ;
  echo -e "\033[1;38;5;196m    /_____/ \__,_/ /_/ /_/_\__, / \___//_/    (_)\033[0m" ;
  echo -e "\033[1;38;5;196m                          /____/\033[0m\n" ;
  echo -ne "\033[1;38;5;196m" && printf "%*s\n" $(((${#_dangerMSG}+52)/2)) "${_dangerMSG}" && echo -e "\033[0m" ;
}

# Function that check all the required things for the script to run
_preCHECK() {
  # Checks if we run as super-user... else... a quote from Linus Torvald.
  [[ ${EUID} -ne 0 ]] && >&2 echo '“ You not only have to be a good coder to create a system like Linux, you have to be a sneaky bastard, too. ” -LT' && exit 1 ;

  # Checks if we run a x86_64 architecture, else abort.
  _ARCH_TYPE=$(uname -m) ;
  [[ "${_ARCH_TYPE}" != "x86_64" ]] && >&2 echo -e "\033[1;38;5;196mERROR\033[0;1m: This system is not x86_64 compatible, aborting.\033[0m" && exit 1 ;

  # Check if we are using centos at all, else abort.
  [[ ! -f "/etc/centos-release" ]] && >&2 echo -e "\033[1;38;5;196mERROR\033[0;1m: This ain't a CentOS release, aborting.\033[0m" && exit 1 ;

  # Check if we are using the right centos version for this script, else abort.
  _CVER=$(cat /etc/os-release | grep -Pio 'VERSION_ID="\K[[:digit:]"]') ;
  [[ "${_CVER}" != "7" ]] && >&2 echo -e "\033[1;38;5;196mERROR\033[0;1m: Incompatible CentOS release version, aborting.\033[0m" && exit 1 ;
}

# Function to disable SELinux
_doSELINUX() {
  echo -en "\033[1mDisable SELinux? (required to continue) [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m " ; read -er _SEL ;
  case "${_SEL}" in
    [nN][oO]|[no])
      >&2 echo -e "\033[1;38;5;196mERROR\033[0;1m: I require SELinux to be disabled to continue, aborting.\033[0m" ; exit 1 ;
      ;;
    *)
      echo -e "\033[1mDisabling SELinux...\033[0m" ;
      setenforce 0 &>/dev/null ;
      sed -i 's/\(^SELINUX=\).*/\SELINUX=disabled/' /etc/selinux/config 2>/dev/null;
      sed -i 's/\(^SELINUX=\).*/\SELINUX=disabled/' /etc/sysconfig/selinux 2>/dev/null;
      echo -e "  - \033[32mSELinux disabled\033[0;1m.\033[0m" ; sleep 0.3 ;
      ;;
  esac
  unset _SEL ;
}

# Function that imports repo gpg signing keys
_importGPGKEYS() {
  echo -e "\033[1mImporting repositories GPG keys...\033[0m " ;
  rpm --import https://nginx.org/keys/nginx_signing.key ; sleep 0.02 ;
  rpm --import https://rpms.remirepo.net/RPM-GPG-KEY-remi ; sleep 0.02 ;
  rpm --import https://yum.mariadb.org/RPM-GPG-KEY-MariaDB ; sleep 0.02 ;
  rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org ; sleep 0.02 ;
  rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7 ; sleep 0.02 ;
  rpm --import https://download.docker.com/linux/centos/gpg ; sleep 0.02 ;
  rpm --import https://dl.iuscommunity.org/pub/ius/IUS-COMMUNITY-GPG-KEY ; sleep 0.02 ;
  echo -e "  - \033[32mGPG keys imported\033[0;1m.\033[0m" ; sleep 0.3 ;
}

# Function to install repos that we want/should/must have
_installREPOS() {
  echo -e "\033[1mInstalling repository packages for available ones...\033[0m " ;
  rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm &>/dev/null; sleep 0.2 ;
  rpm -Uvh https://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm &>/dev/null; sleep 0.2 ;
  rpm -Uvh https://rpms.remirepo.net/enterprise/remi-release-7.rpm &>/dev/null; sleep 0.2 ;
  echo -e "  - \033[32mRepository packages installed\033[0;1m.\033[0m" ; sleep 0.3 ;

  echo -e "\033[1mCreating repository files (.repo) for repositories without install packages...\033[0m " ;

	# Create the MariaDB repo file
	cat <<- __EOF__ | tee /etc/yum.repos.d/mariadb.repo &>/dev/null ;
	# Generated by an awesome script on $(date +"%F %R:%S")
	# Get it at ${BRAGURL}
	[MariaDB]
	name=MariaDB ${MARIADBVER} repository for CentOS \$releasever
	baseurl=https://yum.mariadb.org/${MARIADBVER}/centos\$releasever-amd64
	gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
	gpgcheck=1
	enabled=1
	__EOF__
	echo -e "  - \033[32mRepository file for MariaDB ${MARIADBVER} created\033[0;1m.\033[0m"; sleep 0.3 ;

	# Create the NGiNX repo file
	cat <<- __EOF__ | tee /etc/yum.repos.d/nginx.repo &>/dev/null ;
	# Generated by an awesome script on $(date +"%F %R:%S")
	# Get it at ${BRAGURL}
	[nginx]
	name=NGiNX stable repository for CentOS \$releasever
	baseurl=https://nginx.org/packages/centos/\$releasever/\$basearch
	gpgkey=https://nginx.org/keys/nginx_signing.key
	gpgcheck=1
	enabled=1
	__EOF__
  echo -e "  - \033[32mRepository file for NGiNX created\033[0;1m.\033[0m"; sleep 0.3 ;

  # NodeJS
  echo -e "\033[1mInstalling NodeJS repository from official source...\033[0m" ; sleep 0.2 ;
  bash <(curl -skL https://rpm.nodesource.com/setup_${NODEJSVER}.x) &>/dev/null && \
  echo -e "  - \033[32mNodeJS repository installed\033[0;1m.\033[0m" ; sleep 0.3 ;

  # ius community
  echo -e "\033[1mInstalling ius repository from official source...\033[0m" ; sleep 0.2 ;
  bash <(curl -skL https://setup.ius.io) &>/dev/null && \
  echo -e "  - \033[32mius repository installed\033[0;1m.\033[0m" ; sleep 0.3 ;

  # DockerCE (disabled by default)
  echo -e "\033[1mInstalling Docker CE repository from official source...\033[0m" ; sleep 0.2 ;
  echo -e "# Generated by an awesome script on $(date +"%F %R:%S")\n# Get it at ${BRAGURL}\n#" > /etc/yum.repos.d/docker-ce.repo ;
  curl -skL https://download.docker.com/linux/centos/docker-ce.repo | sed -e 's/enabled=1/enabled=0/' >> /etc/yum.repos.d/docker-ce.repo && \
  echo -e "  - \033[32mDocker CE repository installed (disabled by default)\033[0;1m.\033[0m" ; sleep 0.3 ;
}

# Function to edit repo files
_editREPOS() {
  echo -en "\033[1mEdit repositories to enable/disable some? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m " ; read -er _EDITREPOS ;
  case "${_EDITREPOS}" in
  [nN][oO]|[no])
    sleep 0.3 ;
    ;;
  *)
    # GNU Nano v2.9.1, statically linked
    echo -e "\033[1mGetting nano-static...\033[0m" ; sleep 0.2 ;
    mkdir -p ~/bin &>/dev/null ;
    curl -skL ${REPOURL}/bin/nano-static -o ~/bin/nano-static && \
    chmod +x ~/bin/nano-static &>/dev/null ; sleep 0.1 ;
    echo -e "  - \033[32mnano-static installed in ~/bin\033[0;1m.\033[0m" ; sleep 0.3 ;
    ~/bin/nano-static /etc/yum.repos.d/*.repo ;
    ;;
  esac
  unset _EDITREPOS ;
}

# Function to update system packages
_updateSYSTEM() {
  # Clear/refresh yum cache
  echo -ne "\033[1mCleaning YUM cache...\033[0m" ; sleep 0.2 ;
  yum clean all &>/dev/null ; echo -e "\033[32m DONE\033[0;1m.\033[0m" ;
  echo -ne "\033[1mGenerating a new cache (please wait)...\033[0m" ; sleep 0.2 ;
  yum makecache fast &>/dev/null ; echo -e "\033[32m DONE\033[0;1m.\033[0m" ;
  # Yum-utils and deltarpm
  echo -e "\033[1mInstalling deltarpm, yum-axelget and yum-utils...\033[0m" ; sleep 0.2;
  yum install yum-utils deltarpm yum-axelget -y &>/dev/null
  echo -e "  - \033[32mPackages installed\033[0;1m.\033[0m" ; sleep 0.3 ;
  # System update
  echo -e "\033[1mInstalling system updates (please wait)...\033[0m" ; sleep 0.2 ;
  yum -y update &>/dev/null ;
  echo -e "  - \033[32mSystem update completed\033[0;1m.\033[0m" ; sleep 0.3 ;
  # Compat libs
  echo -e "\033[1mInstalling compatibility package groups...\033[0m" ; sleep 0.2 ;
  yum -y groups install "Compatibility Libraries" "Legacy UNIX Compatibility" &>/dev/null ;
  echo -e "  - \033[32mCompatibility package groups installed\033[0;1m.\033[0m" ; sleep 0.3 ;
}

# Function to fix yum to only use ipv4
_fixYUMV6() {
  # This comes from a problem i faced on fedora and c7 with epel throwing garbage at ipv6 requests, making any
  # update attemps unsuccessfull... that fucked me good but the guys there fixed it quick after i told them.
  # You do whatever. I rather disable ipv6 for yum than swear, even for only a few seconds.
  echo -e "\033[1mFixing 'potential' IPv6 problem with some repos...\033[0m" ; sleep 0.2 ;
  echo "ip_resolve=4" >> /etc/yum.conf ;
  echo -e "  - \033[32mYum 'potential' IPv6 problem fixed\033[0;1m.\033[0m" ; sleep 0.3 ;
}

# Function to update grub2 bootloader
_updateGRUB() {
  echo -e "\033[1mGetting 'update-grub' tool...\033[0m" ; sleep 0.2 ;
  mkdir -p ~/bin &>/dev/null ;
  curl -skL ${REPOURL}/bin/update-grub -o ~/bin/update-grub ;
  chmod +x ~/bin/update-grub &>/dev/null ; sleep 0.1 ;
  echo -e "  - \033[32mGrub-updater tool installed in ~/bin\033[0;1m. Updating grub2 now.\033[0m\n" ; sleep 0.3 ;
  rm -f /boot/grub2/grubenv; ~/bin/update-grub ; echo ;
}

# Function to install development group packages
_installDEVEL() {
  echo -en "\033[1mInstall development tools package group? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m " ; read -er _DEVPACK ;
  case "${_DEVPACK}" in
    [nN][oO]|[no])
      sleep 0.3 ;
      ;;
    *)
      echo -e "\033[1mInstalling development tools package group...\033[0m" ; sleep 0.2 ;
      yum -y groups install "Development Tools" "Fedora Packager" &>/dev/null ;
      yum -y install ruby-devel boost-devel boost-static zlib-devel zlib-static openssl-devel koji-utils glibc-static nasm &>/dev/null ;
      rpmdev-setuptree &>/dev/null ; # Setup the rpm build tree
      echo -e "  - \033[32mDevelopment tools group package installed\033[0;1m.\033[0m" ; sleep 0.3 ;
      ;;
  esac
  unset _DEVPACK ;
}

# Function to install/enable MariaDB
_installMARIADB() {
  rpm -q MariaDB-server &>/dev/null ;
  if [[ $? -ne 0 ]]; then
    _MARIADB_INST=0 ; echo -en "\033[1mInstall MariaDB server? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m " ;
  else
    _MARIADB_INST=1 ; echo -en "\033[1mMariaDB already installed. Re-install MariaDB server? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m " ;
  fi
  read -er _MARIADB ;
  case "${_MARIADB}" in
    [nN][oO]|[no])
      sleep 0.3 ;
      ;;
    *)
      [[ ${_MARIADB_INST} -eq 0 ]] && echo -e "\033[1mInstalling MariaDB server...\033[0m" || echo -e "\033[1mRe-installing MariaDB server...\033[0m" ; sleep 0.2 ;
      [[ ${_MARIADB_INST} -eq 0 ]] && yum -y install MariaDB-server MariaDB-client &>/dev/null || yum -y reinstall MariaDB-server MariaDB-client &>/dev/null ;
      echo -e "  - \033[32mMariaDB server installed\033[0m." ;
      sed -i.c7repos.OLD 's/\[server\]/\[server\]\nbind-address = 127.0.0.1/g' /etc/my.cnf.d/server.cnf; sleep 0.3 ;
      echo -ne "\033[1mStarting MariaDB server...\033[0m" ; sleep 0.2 ;
      systemctl enable mariadb --now && echo -e "\033[32m MariaDB started\033[0;1m.\033[0m" ; sleep 1 ;

      if [ ${_MARIADB_INST} -eq 0 ]; then
        echo -en "\033[1mWould you like me to set a random root password? [y/\033[0;1;38;5;40mN\033[0;1m]\033[0m " ; read -er _SQLPASS ;
        case "${_SQLPASS}" in
          [yY][eE][sS]|[yes])
            _RNDPASS=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w18 | head -n1) ; mysqladmin -u root password ${_RNDPASS} ;
            echo -e "\033[1mThe newly created and set MariaDB root password is: \033[1;37;41m  ${_RNDPASS}  \033[0m\n" ; unset _RNDPASS ; sleep 0.3 ;
            echo -e "\033[1;38;5;196mTAKE NOTE OF iT, iT iS NOT LOGGED ANYWHERE. THiS iS THE ONLY TiME YOU WiLL SEE iT.\033[0m" ; sleep 0.5 ;
            echo -e "\033[1;38;5;196mTAKE NOTE OF iT, iT iS NOT LOGGED ANYWHERE. THiS iS THE ONLY TiME YOU WiLL SEE iT.\033[0m" ; sleep 0.5 ;
            echo -e "\033[1;38;5;196mTAKE NOTE OF iT, iT iS NOT LOGGED ANYWHERE. THiS iS THE ONLY TiME YOU WiLL SEE iT.\033[0m" ; sleep 1.5 ;
            echo -e "\033[1mWhen asked for the root password, enter the previously shown password.\033[0m" ; sleep 1.5 ;
            ;;
          *)
            echo -e "\033[1mWhen asked for the root password, if you have not set one yet, just press ENTER.\033[0m" ; sleep 1.5 ;
            ;;
        esac
        read -rsp $'\033[1;37;41m PRESS ENTER TO CONTiNUE. \033[0m\n' ;
      fi

      echo -e "\n\033[1;38;5;196;4mIMPORTANT INFORMATIONS:\033[0m\n" ;
      echo -e "\033[1mI will open up MariaDB secure installation in a moment.\033[0m" ; sleep 0.5 ;
      echo -e "\033[1mI have already taken one step to secure MariaDB by setting its listening address\nto 127.0.0.1(localhost) so it's NOT exposed to the outside world.\033[0m" ; sleep 1 ;
      echo -e "\033[1mUnless you know precisely what you are doing, all the answers except the first one\nabout root password should be answered by YES or simply by pressing ENTER.\033[0m" ; sleep 1 ;
      read -rsp $'\033[1;37;41m PRESS ENTER TO CONTiNUE. \033[0m\n' ;
      echo -e "\033[1mStarting MariaDB secure installation...\033[0m" ; sleep 0.2 ;
      mysql_secure_installation ; echo -e "\n  - \033[32m DONE Securing MariaDB\033[0;1m.\033[0m" ;
      ;;
  esac
  unset _MARIADB _MARIADB_INST _SQLPASS _RNDPASS;
}

# Function to install/enable NGiNX
_installNGINX() {
  rpm -q nginx &>/dev/null ;
  if [[ $? -ne 0 ]]; then
    _NGX_INST=0 ; echo -en "\033[1mInstall \033[0;32mNGiNX\033[0;1m? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m " ; read -er _GINX ;
  else
    _NGX_INST=1 ; echo -en "\033[0;32mNGiNX\033[0;1m already installed. Re-install? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m " ; read -er _GINX ;
  fi

  case "${_GINX}" in
    [nN][oO]|[no])
      sleep 0.3 ;
      ;;
    *)
      [[ ${_NGX_INST} -eq 0 ]] && echo -e "\033[1mInstalling \033[0;32mNGiNX\033[0;1m...\033[0m" || echo -e "\033[1mRe-installing \033[0;32mNGiNX\033[0;1m...\033[0m" ; sleep 0.2 ;
      [[ ${_NGX_INST} -eq 0 ]] && yum -y install nginx &>/dev/null || yum -y reinstall nginx &>/dev/null ;
      nginx -t &>/dev/null;
      [[ $? -eq 0 ]] && {
        _NGXPID="$(pidof nginx)" ;
        [[ -z ${_NGXPID} ]] && echo -ne "\033[1mStarting \033[0;32mNGiNX\033[0;1m...\033[0m" && sleep 0.2 ;
        systemctl enable nginx --now &>/dev/null && echo -e "\033[32m NGiNX\033[0;1m started.\033[0m" && sleep 1 ;
      }
      echo -e "  - \033[32mNGiNX installed\033[0;1m.\033[0m" ; sleep 0.3 ;
      _NGX_INST=1 ;
      ;;
  esac
  unset _NGXPID _GINX ;
}

# Function to install NodeJS/NPM
_installNODE() {
  rpm -q nodejs &>/dev/null ;
  if [[ $? -ne 0 ]]; then
    _NODE_INST=0 ; echo -en "\033[1mInstall NodeJS and update NPM to current version? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m " ; read -er _NODENPM ;
  else
    _NODE_INST=1 ; echo -en "\033[1mNodeJS already installed. Re-install and update to current version? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m " ; read -er _NODENPM ;
  fi

  case "${_NODENPM}" in
    [nN][oO]|[no])
      sleep 0.3 ;
      ;;
    *)
      [[ ${_NODE_INST} -eq 0 ]] && echo -e "\033[1mInstalling NodeJS/NPM...\033[0m" || echo -e "\033[1mRe-installing NodeJS/NPM...\033[0m" ; sleep 0.2
      [[ ${_NODE_INST} -eq 0 ]] && yum -y install nodejs &>/dev/null || yum -y reinstall nodejs &>/dev/null ;
      echo -e "  - \033[32mNodeJS installed\033[0;1m.\033[0m" ; sleep 0.3 ;
      echo -e "\033[1mUpgrading NPM to latest/current version...\033[0m" ; sleep 0.2 ;
      # Upgrades npm to latest version
      npm install npm -g --upgrade &>/dev/null ;
      echo -e "  - \033[32mNPM upgraded\033[0;1m.\033[0m" ; sleep 0.3 ;
      # Generates npm bash completion file
      echo -e "\033[1mCreating NPM completion file...\033[0m" ; sleep 0.2 ;
      echo -e "# Generated by an awesome script on $(date +"%F %R:%S")\n# Get it at ${BRAGURL}\n#" >/usr/share/bash-completion/completions/npm 2>/dev/null;
      npm completion | grep -Ev "^$|^#$|^# " >>/usr/share/bash-completion/completions/npm 2>/dev/null;
      echo -e "# Generated by an awesome script on $(date +"%F %R:%S")\n# Get it at ${BRAGURL}\n#\nunsafe-perm\nsearchlimit=100\nuser-agent='NPM Linux x86_64'" >> ~/.npmrc ;
      echo -e "  - \033[32mNPM completion file created\033[0;1m.\033[0m" ; sleep 0.3 ;
      ;;
  esac
  unset _NODE_INST _NODENPM ;
}

# Function to install the common packages/applications
_installCOMMON() {
  # Set of commonly used packages and utilities to be installed
  _COMMON_PACKAGES=$(curl -skL ${REPOURL}/deps/common_packages.txt) ;

  echo -e "\033[1mInstalling base packages...\033[0m" ; sleep 0.2 ;
  yum -y install ${_COMMON_PACKAGES} &>/dev/null ;
  export EDITOR=$(which nano) ;
  systemctl enable iptables --now &>/dev/null ; systemctl enable ip6tables --now &>/dev/null ;
  mkdir -p ~/.parallel && touch ~/.parallel/will-cite ;

  # Perform python-pip commands if installed
  rpm -q python-pip &>/dev/null ;
  [[ $? -ne 0 ]] && {
    echo -e "\033[1mCreating Python PIP completion file...\033[0m" ; sleep 0.2 ;
    # Upgrades pip to latest version
    pip install pip --upgrade &>/dev/null ;
    # Generates pip completion file
    echo -e "# Generated by an awesome script on $(date +"%F %R:%S")\n# Get it at ${BRAGURL}\n#" >/usr/share/bash-completion/completions/pip 2>/dev/null;
    pip completion --bash | grep -Ev "^$" >>/usr/share/bash-completion/completions/pip 2>/dev/null ;
    # Install speedtest-cli (https://github.com/sivel/speedtest-cli)
    pip install speedtest-cli &>/dev/null ;
    # Install pyftpdlib (https://github.com/giampaolo/pyftpdlib)
    pip install pyftpdlib &>/dev/null ;
    echo -e "  - \033[32mPython PIP completion file created\033[0;1m.\033[0m" ; sleep 0.3 ;
  }

  echo "# Source the bash completion files needed for completion to work" >> ~/.bashrc ;
  echo "[[ -f /etc/bash_completion ]] && source /etc/bash_completion" >> ~/.bashrc ;
  echo "[[ -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion" >> ~/.bashrc ;
  echo -e "  - \033[32mBase packages installed\033[0m." ; sleep 0.3 ;
}

# Function to create our dotfiles
_createDOTFILES() {
  # Append some stuff to .bashrc
  echo -e "\033[1mAppending to ~/.bashrc...\033[0m" ; sleep 0.2 ;
  #echo -e "\nshopt -s checkwinsize\nshopt -s histappend\nexport HISTIGNORE='&:exit:x:l:history:editenv:[h ]*:[ \\\t]*:?:??:w -i:pwd:srcalias*:srcexports*:srcfunctions*:srccolors*:srcdot*:env:quit:popd*:ginx*:chownwww*:yum clean*:yum makecache*'\nexport HISTCONTROL=ignoreboth\nexport HISTSIZE=20000\nexport HISTFILESIZE=100000\nexport HISTTIMEFORMAT=\"%Y/%m/%d %T \"" >> ~/.bashrc ;
  echo -e "\n# Source ~/.bash_* files not excluded by the grep command" >> ~/.bashrc ;
  echo 'for DFs in $(ls -1p ~/.bash_* | \grep -Ev "history|logout|profile|back|/$"); do source ${DFs}; done' >> ~/.bashrc ;

  # Creates the functions file
  echo -e "\033[1mCreating functions file at ~/.bash_functions...\033[0m" ; sleep 0.2 ;
  echo -e "# .bash_functions - Functions file added by an awesome script on $(date +"%F %R:%S")\n# Get it at ${BRAGURL}\n#" >> ~/.bash_functions ;
    # Get the functions raw files from the repo
    curl -skL ${REPOURL}/deps/functions_list.txt > /tmp/fl.txt ;
    while read _FSRC; do
      curl -skL ${REPOURL}/functions/${_FSRC} >> ~/.bash_functions ;
      echo '' >> ~/.bash_functions ;
    done < /tmp/fl.txt
    rm -f /tmp/fl.txt ;

  # Creates the aliases file
  echo -e "\033[1mCreating alias file at ~/.bash_aliases...\033[0m" ; sleep 0.2 ;
  echo -e "# .bash_aliases - Aliases file created by an awesome script on $(date +"%F %R:%S")\n# Get it at ${BRAGURL}\n#" >> ~/.bash_aliases ;
    # Get the aliases file from the repo
    curl -skL ${REPOURL}/aliases/bash_aliases >> ~/.bash_aliases ;
  echo -e "  - \033[32mBash aliases/functions files created\033[0;1m.\n    They will be sourced automatically upon next login.\033[0m" ; sleep 0.3 ;

  # Creates the export file
  echo -e "\033[1mAdding a random colored PS1 to exports...\033[0m" ; sleep 0.2 ;
  _RND=$(shuf -n3 -i 21-231); _C1=$(echo ${_RND}|cut -d' ' -f1); _C2=$(echo ${_RND}|cut -d' ' -f2); _C3=$(echo ${_RND}|cut -d' ' -f3);
  _RNDPS1="\[\033[1m\][\[\033[1;38;5;${_C1}m\]\u\[\033[0m\]@\[\033[1;38;5;${_C2}m\]\H\[\033[0;1m\]] \[\033[1;38;5;${_C3}m\]\w\[\033[0;1m\] \\$\[\033[0m\] "
  echo -e "# .bash_exports - Export file created by an awesome script on $(date +"%F %R:%S")\n# Get it at ${BRAGURL}\n#" >> ~/.bash_exports ;
  echo -e "export PS1=\"${_RNDPS1}\";" >> ~/.bash_exports ;
  echo -e "export EDITOR=\$(which nano);" >> ~/.bash_exports ;
  echo -e "\nshopt -s checkwinsize\nshopt -s histappend\nexport HISTCONTROL=ignoreboth\nexport HISTSIZE=20000\nexport HISTFILESIZE=100000\nexport HISTTIMEFORMAT=\"%Y/%m/%d %T \"" >> ~/.bash_exports ;
  echo -e '  - \033[32mRandom PS1 added to the exports\033[0;1m'; sleep 0.3 ;
}

# Function to check for current running ssh port - Might have some issues with proper detection
_checkSSH() {
  # Checking the ssh server port, relying on which port user currently is connected on
  if [[ ${SSH_CLIENT##* } -eq 22 ]]; then
    _showDANGER "SSH IS RUNNING ON PORT 22";
    echo -en "\033[1mShould We Change SSH Port NOW? [\033[0;1;38;5;40mY\033[0;1m/n]\033[0m " ; read -er _SSHP ;
    case "${_SSHP}" in
      [nN][oO]|[no])
        _showDANGER "SSH PORT UNCHANGED AND STILL ON 22" ; sleep 2 ;
        ;;
      *)
        echo -en "\033[1mChange SSH To Which Port (integers only)? \033[0m" ; read -er _SSHPC ; _SSHPC=${_SSHPC##*[!0-9]*} ;
        if ! [[ -z ${_SSHPC} || ${_SSHPC} -eq 22 ]]; then
          # Delete the Port line, commented or not.
          sed -i '/Port 22/d' /etc/ssh/sshd_config ;
          # Add a new Port line, with our new port
          echo -e "\nPort ${_SSHPC}" >> /etc/ssh/sshd_config ;
          # Restart SSH daemon
          systemctl restart sshd ; unset SSH_CLIENT ;

          # Fix BOTH iptables default files with new port
          yum -y install iptables ip6tables iptables-services &>/dev/null ;
          [[ -f /etc/sysconfig/ip6tables ]] && sed -i "s#--dport 22#--dport ${_SSHPC}#" /etc/sysconfig/ip6tables ;
          [[ -f /etc/sysconfig/iptables ]] && sed -i "s#--dport 22#--dport ${_SSHPC}#" /etc/sysconfig/iptables ;

          # --now toggles starting the service immediately
          systemctl disable firewalld --now &>/dev/null ;
          systemctl enable iptables --now &>/dev/null ;
          systemctl enable ip6tables --now &>/dev/null ;
          systemctl restart iptables &>/dev/null ;
          echo -e "  - \033[32mSSH port changed\033[0;1m.\033[0m" ; sleep 0.3 ;
          echo -e "\n\033[1;38;5;196;4mMAKE SURE YOU REMEMBER IT AS IT IS IN EFFECT NOW.\033[0m" ; sleep 2 ;
          echo -e "\033[1;38;5;196;4mMAKE SURE YOU REMEMBER IT AS IT IS IN EFFECT NOW.\033[0m\n" ; sleep 1 ;
        else
          _showDANGER "BAD INPUT. SSH IS STILL RUNNING ON PORT 22" ; sleep 2 ;
        fi
        unset _SSHPC ;
        ;;
      esac
      unset _SSHP ;
  fi
}

# Function to create ~/.nanorc and syntax highlighting files (*.nanorc files) in /usr/share/nano
_createNANORC() {
  # Creates nano's syntax highlighting files (from nano v2.8.6)
  echo -e "\033[1mCreating nano syntax highlighting files in /usr/share/nano...\033[0m" ; sleep 0.2 ;
  bash <(curl -skL ${REPOURL}/deps/nanorc.sh) ;

  # Creates ~/.nanorc file
  echo -e "\033[1mCreating ~/.nanorc file...\033[0m" ; sleep 0.2 ;
  curl -skL ${REPOURL}/deps/nanorc.txt >> ~/.nanorc ;
}

# Call to show our header
_showHEADER ;
# Call to check if all is correct to run the script...
_preCHECK ;
# Call to the disable SELinux function
_doSELINUX ;
# Call to check SSH port and change if needed/wanted
_checkSSH ;
# Call to import the repo gpg keys
_importGPGKEYS ;
# Call to install/create known repos files
_installREPOS ;
# Call to create nanorc files
_createNANORC
# Call to edit repo files
_editREPOS ;
# Call to fix yum ipv6 potential problem
_fixYUMV6 ;
# Call to update sys packages
_updateSYSTEM ;
# Call to update grub2 bootloader
_updateGRUB ;
# Call to install devel packages
_installDEVEL ;
# Call to install MariaDB
_installMARIADB ;
# Call to install NGiNX
_installNGINX ;
# Call to install NODEJS
_installNODE ;
# Call to install common packages
_installCOMMON ;
# Call to create aliase and function
_createDOTFILES ;

echo -e "\n\033[1mDone with this CentOS 7 auto install script.\nConsider checking your firewall, SSH config and the likes.\nA reboot wouldn't hurt, after initial install...\n\nHave a nice day.\033[0m" ;
