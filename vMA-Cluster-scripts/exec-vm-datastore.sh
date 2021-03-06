#! /bin/sh
#***************************************
#*              start.sh               *
#***************************************

################
## Configuration

# The name of the Failover group in iSCSI Target Cluster
GRP="failover-iscsi"

# IP address of Primary node of iSCSI Target Cluster
IP1="10.0.0.11"

# IP address of Secondary node of iSCSI Target Cluster
IP2="10.0.0.12"

################

if [ "$CLP_EVENT" = "START" ]
then
	echo "NORMAL1"
	if [ "$CLP_SERVER" = "HOME" ]
	then
		echo "NORMAL2"
		clprexec --failover $GRP -h $IP2
	else
		echo "ON_OTHER1"
		clprexec --failover $GRP -h $IP1
	fi
elif [ "$CLP_EVENT" = "FAILOVER" ]
then
	echo "FAILOVER1"
	if [ "$CLP_SERVER" = "HOME" ]
	then
		echo "FAILOVER2"
		clprexec --failover $GRP -h $IP2
	else
		echo "ON_OTHER2"
		clprexec --failover $GRP -h $IP1
	fi
else
	echo "NO_CLP"
	exit 1
fi
echo "EXIT"
exit 0
