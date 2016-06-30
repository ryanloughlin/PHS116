#!/bin/bash

####################################################################
#
#	check_dev.sh | PHS 116 | Every login
#
####################################################################

# Check if the user a member of the _developer group
is_dev=$(dseditgroup -o checkmember -m $USER _developer)

# If user isn't a member of the _developer group then add them
if [[ $is_dev == *"NOT"* ]]; then
	dseditgroup -o edit -n /Local/Default -u localadmin -P '1day@time!' -a $USER -L _developer
fi
