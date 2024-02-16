#!/bin/bash

PACKAGE_NAME=shadow
VERSION=4.13
DOWNLOAD_URL=https://github.com/shadow-maint/shadow/releases/download/4.13/shadow-4.13.tar.xz
MD5_SUM=b1ab01b5462ddcf43588374d57bec123
SRC_COMPRESSED_FILE=$(echo $DOWNLOAD_URL | rev | cut -d '/' -f 1 | rev)
SRC_FOLDER=$PACKAGE_NAME-$VERSION

build_source_package(){
    sed -i 's/groups$(EXEEXT) //' src/Makefile.in          &&

	find man -name Makefile.in -exec sed -i 's/groups\.1 / /'   {} \; &&
	find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \; &&
	find man -name Makefile.in -exec sed -i 's/passwd\.5 / /'   {} \; &&

	sed -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD YESCRYPT@' \
	    -e 's@/var/spool/mail@/var/mail@'                   \
	    -e '/PATH=/{s@/sbin:@@;s@/bin:@@}'                  \
	    -i etc/login.defs                                   &&
	
	./configure --sysconfdir=/etc               \
		    --disable-static                \
		    --with-{b,yes}crypt             \
		    --with-group-name-max-length=32 &&
	make $MAKEFLAGS
    make exec_prefix=/usr install
    make -C man install-man

    install -v -m644 /etc/login.defs /etc/login.defs.orig &&
	for FUNCTION in FAIL_DELAY               \
                FAILLOG_ENAB             \
                LASTLOG_ENAB             \
                MAIL_CHECK_ENAB          \
                OBSCURE_CHECKS_ENAB      \
                PORTTIME_CHECKS_ENAB     \
                QUOTAS_ENAB              \
                CONSOLE MOTD_FILE        \
                FTMP_FILE NOLOGINS_FILE  \
                ENV_HZ PASS_MIN_LEN      \
                SU_WHEEL_ONLY            \
                CRACKLIB_DICTPATH        \
                PASS_CHANGE_TRIES        \
                PASS_ALWAYS_WARN         \
                CHFN_AUTH ENCRYPT_METHOD \
                ENVIRON_FILE
	do
	    sed -i "s/^${FUNCTION}/# &/" /etc/login.defs
	done
    cat > /etc/pam.d/login << "EOF"
# Begin /etc/pam.d/login

# Set failure delay before next prompt to 3 seconds
auth      optional    pam_faildelay.so  delay=3000000

# Check to make sure that the user is allowed to login
auth      requisite   pam_nologin.so

# Check to make sure that root is allowed to login
# Disabled by default. You will need to create /etc/securetty
# file for this module to function. See man 5 securetty.
#auth      required    pam_securetty.so

# Additional group memberships - disabled by default
#auth      optional    pam_group.so

# include system auth settings
auth      include     system-auth

# check access for the user
account   required    pam_access.so

# include system account settings
account   include     system-account

# Set default environment variables for the user
session   required    pam_env.so

# Set resource limits for the user
session   required    pam_limits.so

# Display the message of the day - Disabled by default
#session   optional    pam_motd.so

# Check user's mail - Disabled by default
#session   optional    pam_mail.so      standard quiet

# include system session and password settings
session   include     system-session
password  include     system-password

# End /etc/pam.d/login
EOF

    cat > /etc/pam.d/passwd << "EOF"
# Begin /etc/pam.d/passwd

password  include     system-password

# End /etc/pam.d/passwd
EOF

    cat > /etc/pam.d/su << "EOF"
# Begin /etc/pam.d/su

# always allow root
auth      sufficient  pam_rootok.so

# Allow users in the wheel group to execute su without a password
# disabled by default
#auth      sufficient  pam_wheel.so trust use_uid

# include system auth settings
auth      include     system-auth

# limit su to users in the wheel group
# disabled by default
#auth      required    pam_wheel.so use_uid

# include system account settings
account   include     system-account

# Set default environment variables for the service user
session   required    pam_env.so

# include system session settings
session   include     system-session

# End /etc/pam.d/su
EOF

    cat > /etc/pam.d/chpasswd << "EOF"
# Begin /etc/pam.d/chpasswd

# always allow root
auth      sufficient  pam_rootok.so

# include system auth and account settings
auth      include     system-auth
account   include     system-account
password  include     system-password

# End /etc/pam.d/chpasswd
EOF

    sed -e s/chpasswd/newusers/ /etc/pam.d/chpasswd >/etc/pam.d/newusers

    cat > /etc/pam.d/chage << "EOF"
# Begin /etc/pam.d/chage

# always allow root
auth      sufficient  pam_rootok.so

# include system auth and account settings
auth      include     system-auth
account   include     system-account

# End /etc/pam.d/chage
EOF
    for PROGRAM in chfn chgpasswd chsh groupadd groupdel \
               groupmems groupmod useradd userdel usermod
    do
	install -v -m644 /etc/pam.d/chage /etc/pam.d/${PROGRAM}
	sed -i "s/chage/$PROGRAM/" /etc/pam.d/${PROGRAM}
    done

    if [ -f /etc/login.access ]; then mv -v /etc/login.access{,.NOUSE}; fi

    if [ -f /etc/limits ]; then mv -v /etc/limits{,.NOUSE}; fi

}

