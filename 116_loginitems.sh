#!/bin/bash

####################################################################
#
#	116_loginitems.sh | PHS 116 | Login Once
#
####################################################################

# Install user profiles
if [[ $USER != "localadmin" ]] && [[ $USER != "psdguest" ]]; then
    /usr/bin/profiles -IvF "/Library/Profiles/PHS116_loginitems.mobileconfig";
fi