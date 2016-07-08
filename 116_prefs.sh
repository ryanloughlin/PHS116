#!/bin/bash

####################################################################
#
#	Application Prefs PHS 116 CS Lab
#
####################################################################

#/////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#					      Sidebar
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\////////////////////////////////

/usr/local/sbin/mysides add Public "file:///Volumes/phspublic/Computer/tmerry"


#/////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#					   Google SketchUp
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\////////////////////////////////

CIDstring=$(uuidgen)

/usr/libexec/PlistBuddy -c "Add :Application dict" ~/Library/Preferences/com.sketchup.SketchUp.2016.plist
/usr/libexec/PlistBuddy -c "Add :Application:CID string $CIDstring" ~/Library/Preferences/com.sketchup.SketchUp.2016.plist

/usr/libexec/PlistBuddy -c "Add :Preferences dict" ~/Library/Preferences/com.sketchup.SketchUp.2016.plist
/usr/libexec/PlistBuddy -c "Add :Preferences:CheckForUpdates bool false" ~/Library/Preferences/com.sketchup.SketchUp.2016.plist
/usr/libexec/PlistBuddy -c "Add :Preferences:DefaultTemplate16 string '/Applications/SketchUp.app/Contents/Resources/Content/Resources/en-US/Templates/Temp01a - Simple.skp'" ~/Library/Preferences/com.sketchup.SketchUp.2016.plist

/usr/libexec/PlistBuddy -c "Add :WelcomeDialog dict" ~/Library/Preferences/com.sketchup.SketchUp.2016.plist
/usr/libexec/PlistBuddy -c "Add :WelcomeDialog:ShowOnStartup bool false" ~/Library/Preferences/com.sketchup.SketchUp.2016.plist
/usr/libexec/PlistBuddy -c "Add :eulaAccepted bool true" ~/Library/Preferences/com.sketchup.SketchUp.2016.plist

#/////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
#					   	    BlueJ
#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\////////////////////////////////

mkdir ~/Library/Preferences/org.bluej
echo -e "blackbox.uuid=optout" >> ~/Library/Preferences/org.bluej/bluej.properties