#!/bin/bash

# Specify colors for shell
red='tput setaf 1'              # red
green='tput setaf 2'            # green
yellow='tput setaf 3'           # yellow
blue='tput setaf 4'             # blue
violet='tput setaf 5'           # violet
cyan='tput setaf 6'             # cyan
white='tput setaf 7'            # white
txtbld=$(tput bold)             # Bold
bldred=${txtbld}$(tput setaf 1) # Bold red
bldgrn=${txtbld}$(tput setaf 2) # Bold green
bldblu=${txtbld}$(tput setaf 4) # Bold blue
bldcya=${txtbld}$(tput setaf 6) # Bold cyan
normal='tput sgr0'

echo "                                                                        ";
echo "                                                                        ";
tput setaf 1
echo " /##     /##                         /######              /##           ";
echo "|  ##   /##/                        /##__  ##            | ##           ";
tput setaf 3
echo " \  ## /##//######  /##   /##      | ##  \__/  /######  /######         ";
echo "  \  ####//##__  ##| ##  | ##      | ## /#### /##__  ##|_  ##_/         ";
tput setaf 2
echo "   \  ##/| ##  \ ##| ##  | ##      | ##|_  ##| ##  \ ##  | ##           ";
echo "    | ## | ##  | ##| ##  | ##      | ##  \ ##| ##  | ##  | ## /##       ";
tput setaf 1
echo "    | ## |  ######/|  ######/      |  ######/|  ######/  |  ####/       ";
echo "    |__/  \______/  \______/        \______/  \______/    \___/         ";
tput setaf 3
echo " /#######                          /##                           /## /##";
echo "| ##__  ##                        |__/                          | ##| ##";
tput setaf 2
echo "| ##  \ ##  /######  /######/####  /## /##   /##  /######   /#######| ##";
echo "| #######/ /##__  ##| ##_  ##_  ##| ##|  ## /##/ /##__  ## /##__  ##| ##";
tput setaf 1
echo "| ##__  ##| ########| ## \ ## \ ##| ## \  ####/ | ########| ##  | ##|__/";
echo "| ##  \ ##| ##_____/| ## | ## | ##| ##  >##  ## | ##_____/| ##  | ##    ";
tput setaf 3
echo "| ##  | ##|  #######| ## | ## | ##| ## /##/\  ##|  #######|  ####### /##";
echo "|__/  |__/ \_______/|__/ |__/ |__/|__/|__/  \__/ \_______/ \_______/|__/";
tput setaf 2
echo "                                                                        ";
echo "                                                                        ";
tput sgr0
tput setaf 3
echo -e "";
echo -e " √ Build is Successfully Done! ";
echo -e "";

tput setaf 4
echo -e " 〉Powered by ANDROID ™  // NOUGAT";
echo -e "";
tput setaf 1
echo -e " 〉Enjoy the Resurrection Remix OS // #GETRESURRECTED ";
tput sgr0
echo -e "";
