#!/bin/bash


####################################################################
#
#	116_dock.sh | PHS 116 | Login Once
#
####################################################################


#///////////////////////////////////////////////////////////////////
#	SET VARIABLES
#///////////////////////////////////////////////////////////////////

# set to the path of dockutil
dockutil="/usr/local/sbin/dockutil"

#
DIRECTORY="/Volumes/phspublic"

# Checks to see if this is a lab admin
is_teacher=$(dseditgroup -o checkmember -m $USER -L labadmin)

# Array of student apps
#
stApps=(
	'/Applications/Safari.app'
	'/Applications/Firefox.app'
	'/Applications/Google Chrome.app'
	'/Applications/Xcode.app'
	'/Applications/Python 3.5/Python Launcher.app'
	'/Applications/Python 3.5/IDLE.app'
	'/Applications/BlueJ 3.1.7/BlueJ.app'
	'/Applications/Greenfoot 3.0.3/Greenfoot.app'
        '/Applications/Adobe Photoshop CS5.1/Adobe Photoshop CS5.1.app'
        '/Applications/Adobe Illustrator CS5.1/Adobe Illustrator.app'
        '/Applications/Adobe Flash CS5.5/Adobe Flash CS5.5.app'
        '/Applications/Adobe Fireworks CS5.1/Adobe Fireworks CS5.1.app'
        '/Applications/Adobe Dreamweaver CS5.5/Adobe Dreamweaver CS5.5.app'
	'/Applications/Cheetah3d.app'
	'/Applications/Toon Boom Studio 6.0/Toon Boom Studio 6.0.app'
	'/Applications/OpenToonz_1.0.app'
	'/Applications/SketchUp.app'
	'/Applications/Blender/Blender.app'
	'/Applications/Audacity/Audacity.app'
	'/Applications/iBooks Author.app'
	'/Applications/Pages.app'
	'/Applications/Numbers.app'
	'/Applications/Keynote.app'
	)

# Array of student volumes
stVols=(
	'~/' \
	'/Volumes/phspublic/'
	)

# Array of Lab Admin apps
laApps=(
	'/Applications/Remote Desktop.app'
	)

# Array of Lab Admin apps
laVols=()

#///////////////////////////////////////////////////////////////////
#	DO STUFF
#///////////////////////////////////////////////////////////////////


# Delete everything from the dock and replace it with a specific
# selection of apps.
${dockutil} --remove all --no-restart
sleep 2 # we add a delay so that the dock has time to inialize the removal

for i in "${!stApps[@]}"
do
	${dockutil} --add "${stApps[$i]}" --no-restart
done

for i in "${!stVols[@]}"
do
	if [ ! -d "$DIRECTORY" ]; then
  		mkdir /Volumes/phspublic
		mount -t smbfs //student/phspublic /Volumes/phspublic
	fi
	${dockutil} --add "${stVols[$i]}" --view list --display folder --no-restart
done

if [[ $is_teacher != *"NOT"* ]]; then
	for i in "${!laApps[@]}"
	do
		${dockutil} --add "${laApps[$i]}" --view list --display folder --no-restart
	done
	for i in "${!laVols[@]}"
	do
		${dockutil} --add "${laVols[$i]}" --view list --display folder --no-restart
	done
fi

killall Dock


#///////////////////////////////////////////////////////////////////
#	EXIT
#///////////////////////////////////////////////////////////////////

exit 0
