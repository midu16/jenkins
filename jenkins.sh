#!/bin/bash
################################################################################
#
# Mihai IDU - 2019
#
# Description :
################################################################################
# https://youtu.be/UupPAfu6Ryk

export DEBIAN_FRONTEND=noninteractive


###################################
# colorful echos
###################################

black='\E[30m'
red='\E[31m'
green='\E[32m'
yellow='\E[33m'
blue='\E[1;34m'
magenta='\E[35m'
cyan='\E[36m'
white='\E[37m'
reset_color='\E[00m'
COLORIZE=1

cecho()  {
    # Color-echo
    # arg1 = message
    # arg2 = color
    local default_msg="No Message."
    message=${1:-$default_msg}
    color=${2:-$green}
    [ "$COLORIZE" = "1" ] && message="$color$message$reset_color"
    echo -e "$message"
    return
}

echo_error()   { cecho "$*" $red          ;}
echo_fatal()   { cecho "$*" $red; exit -1 ;}
echo_warning() { cecho "$*" $yellow       ;}
echo_success() { cecho "$*" $green        ;}
echo_info()    { cecho "$*" $blue         ;}

install_jenkins(){
  echo_ino "The Jenkins Installation Process it Started!"
  sleep 2s
  ./src/install.sh
  echo_info "The Jenkins Installation has Finished!"
}

uninstall_jenkins(){
  echo_info "The Jenkins Uninstalling Process it Started!"
  sleep 2s
  ./src/uninstall.sh
  echo_info "The Jenkins Uninstalling Process has Finished!"
}

############################
# manage options and helps
###########################
function print_help() {
  echo_info '
This program installs the Jenkins software platforms from official repository.
You should have RHEL/CentOS/Ubuntu16.XX/18.XX/19.XX/Fedora or Debian. Root password required.
Options
-h
   print this help
-i | --install-jenkins
   Remove required 3rd party packages and official Jenkins
-r | --remove-jenkins
   Remove required 3rd party packages and official Jenkins

Usage:
$ jenkins.sh -i : install all the software packages required to run the jenkins application
$ jenkins.sh -r : remove all the software packages required to run the jenkins application.
'
}

function main() {
    until [ -z "$1" ]; do

    -i | --install-jenkins)
        INSTALL_PKG=1
        echo_info "Will install Jenkins"
        shift;;
    -r | --remove-jenkins)
        REMOVE_PKG=1
        echo_info "Will remove Jenkins"
        shift;;
    -h | --help)
	print_help
	exit 1;;
    *)
	print_help
	if [ "$1" != "-h" -o "$1" != "--help" -o "$1" != "-help" ]; then 
		echo_fatal "Unknown option $1"
	fi 
	break;;
	esac
done

  if [ "$INSTALL_PKG" = "1" ] ; then
    	install_jenkins()
    	echo_info "Installed the required packages"
    fi
  if [ "$REMOVE_PKG" = "1" ] ; then
      	uninstall_jenkins()
      	echo_info "Uninstalled the required packages"
      fi
  }
