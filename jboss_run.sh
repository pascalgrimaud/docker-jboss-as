#!/bin/bash

echo "Starting container : JBoss AS 7.1.1"

# change the password
if [ ! -f /.jboss_set_password ]; then
	echo "Initializing the admin user password..."

	# generate password
	PASS=${JBOSS_PASS:-$(date +%s | sha256sum | base64 | head -c 16 ; echo)}
	# change password
	/opt/jboss-as-7.1.1.Final/bin/add-user.sh --silent=true admin ${PASS}
	touch /.jboss_set_password
	echo "Initializing the admin user password : done!"
fi

# display info
echo ""
echo "######################################################################"
echo "You can now configure to this JBoss server using:"
echo ""
echo "    Username : admin"
if [ ! -d ${PASS} ]; then
	echo "    Password : ${PASS}"
else
	echo "    Password : ****************"
fi
echo ""
echo "######################################################################"
echo ""

# start JBoss
exec /opt/jboss-as-7.1.1.Final/bin/standalone.sh -b=0.0.0.0
