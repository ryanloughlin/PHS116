###PHS116
These are configuration files for managing the CS/Graphics iMac lab in room 116 at Portsmouth High School.

#### PHS116_loginitems.mobileconfig -
User configuration profile which adds authenticated network mounts at login for the user's network home and phspublic drive.

#### 116_loginitems.sh -
Shell script run at login via [outset](https://github.com/chilcote/outset) which installs the user profile PHS116_loginitems.mobileconfig for network accounts

#### 116_dock.sh -
Shell script run at login via outset which sets up an initial dock (using [dockutil](https://github.com/kcrawford/dockutil)) for CS/Grahics users. There are four arrays (Student Apps, Student Volumes, LabAdmin Apps, LabAdmin Volumes) which can be edited to affect what is part of the initial dock. 
The script is only run once per user (outset login-once) so any user changes to the initial dock are persistent unless the script is run manually or an updated script is provided. Updated versions of the script should have the name versioned to provide a unique name for outset.

#### check_dev.sh -
Shell script run at every login to ensure that the user is a member of the _developer group
