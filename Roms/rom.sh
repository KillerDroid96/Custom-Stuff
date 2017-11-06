#!/bin/bash
# ----------------------------------
#  variables
# ----------------------------------
EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'

# Backup location https://hastebin.com/kogemavuha.bash
 
# ----------------------------------
# User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

pause0(){
    read -p "                        Press [Enter] key to continue..." fackEnterKey
}

# function to display menus

function show_menus() {
    clear
    tput setaf 1

    echo "    _______                                 ______             _               ";
    echo "   (_______)             _                 / _____)           (_)       _      ";
    echo "    _       _   _  ___ _| |_ ___  ____    ( (____   ____  ____ _ ____ _| |_    ";
    echo "   | |     | | | |/___|_   _) _ \|    \    \____ \ / ___)/ ___) |  _ (_   _)   ";
    echo "   | |_____| |_| |___ | | || |_| | | | |   _____) | (___| |   | | |_| || |_    ";
    echo "    \______)____/(___/   \__)___/|_|_|_|  (______/ \____)_|   |_|  __/  \__)   ";
    echo "                                                              |_|              ";
    tput setaf 3
    echo "       ______           ______                    _    _      _ _             ";
    echo "      (____  \         |  ___ \       _   _      | |  / )    | | |            ";
    echo "       ____)  )_   _   | | _ | | ____| |_| |_    | | / / ____| | | ____  ____ ";
    echo "      |  __  (| | | |  | || || |/ _  |  _|  _)   | |< < / _  | | |/ _  )/ ___)";
    echo "      | |__)  | |_| |  | || || ( ( | | |_| |__   | | \ ( (/ /| | ( (/ /| |    ";
    echo "      |______/ \__  |  |_||_||_|\_||_|\___\___)  |_|  \_\____|_|_|\____|_|    ";
    echo "              (____/                                                          ";
    tput setaf 2
    echo "       __ _    _ _ _ _             _____             _     _  ____   __ __    ";
    echo "      / _| |  / (_| | |           (____ \           (_)   | |/ __ \ / /(_ \   ";
    echo "     / / | | / / _| | | ____  ____ _   \ \ ____ ___  _  _ | ( (__) / /_  \ \  ";
    echo "    ( (  | |< < | | | |/ _  )/ ___| |   | / ___/ _ \| |/ || |\__  / __ \  ) ) ";
    echo "     \ \_| | \ \| | | ( (/ /| |   | |__/ | |  | |_| | ( (_| |  / ( (__) _/ /  ";
    echo "      \__|_|  \_|_|_|_|\____|_|   |_____/|_|   \___/|_|\____| /_/ \____(__/   ";
    echo "                                                                              ";
    tput setaf 1
    echo -e "";
    pause0
    clear
    
    #TO DO / ADD

    #Other
    #Python: Only needed for Arch
    #Python3.3: pyvenv venv
    #Python3.0: python3.6 -m venv
    #Python2.0: virtualenv2 venv
    #Activate Python: source venv/bin/activate
    
    #[Neofetch] super awesome system info script
    #Install for Ubuntu: sudo apt install neofetch
    #Install for Arch: yaourt -S neofetch
    
    neofetch

    echo "~~~~~~~~~~~~~~~~~~"
    echo " M A I N  M E N U"
    echo "~~~~~~~~~~~~~~~~~~"
    echo "1. Build ROM"
    echo "2. Fix Sync"
    echo "3. Cleaning"
    echo "4. Configure"
    echo "5. Exit"

}

read_options(){
    local choice
    read -p "Enter choice [ 1 - 5] " choice
    case $choice in
        1) Build_ROM ;;
        2) Fix_Sync ;;
        3) Cleaning ;;
        4) Configure ;;
        5) exit 0;;
        *) echo -e "${RED}Error...${STD}" && sleep 2
    esac
}

Build_ROM(){
    show_menus(){
    clear
    echo "~~~~~~~~~~~~~~~~~~"
    echo " B U I L D  R O M"
    echo "~~~~~~~~~~~~~~~~~~"
    echo "1. Clean"
    echo "2. Dirty"
    echo "3. Exit"
}

read_options(){
    local choice
    read -p "Enter choice [ 1 - 3] " choice
    case $choice in
        1) Clean ;;
        2) Dirty ;;
        3) exit 0;;
        *) echo -e "${RED}Error...${STD}" && sleep 2
    esac
}

Clean(){
        echo "Building Clean Nexus 6P ROM"
        #gnome-terminal -e "watch -n1 -d ccache -s"
        #tilix -q -e "watch -n1 -d ccache -s"
        #tilix -q -e "climate overview"
        #sudo pacman -Sy python2-virtualenv
        #virtualenv2 venv
        source venv/bin/activate
        make clobber
        make clean
        time repo sync --force-sync --no-clone-bundle
        export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx14g"
        ./prebuilts/sdk/tools/jack-admin kill-server
        ./prebuilts/sdk/tools/jack-admin start-server
         echo "${yellow}"
        . build/envsetup.sh 
        brunch angler
        pause
}
 
Dirty(){
        echo "Building Dirty Nexus 6P ROM"
        #gnome-terminal -e "watch -n1 -d ccache -s"
        #tilix -q -e "watch -n1 -d ccache -s"
        source venv/bin/activate
        make dirty
        time repo sync --force-broken --force-sync --no-clone-bundle 
        export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx15g"
        ./prebuilts/sdk/tools/jack-admin kill-server
        ./prebuilts/sdk/tools/jack-admin start-server
        echo "${green}"
        . build/envsetup.sh
        brunch angler
        pause
}
}

Fix_Sync(){
    tput setaf 1
    echo "Remove roomservice.xml from local_manifests"
    tput setaf 2
    pause
    time repo sync --force-broken --force-sync --no-clone-bundle
    time repo sync --force-broken --force-sync --no-clone-bundle
    time repo sync --force-broken --force-sync --no-clone-bundle
    tput setaf 1
    echo "Add roomservice.xml back to local_manifests"
    tput setaf 2
    pause
    time repo sync --force-broken --force-sync --no-clone-bundle
    time repo sync --force-broken --force-sync --no-clone-bundle
    time repo sync --force-broken --force-sync --no-clone-bundle
    return
}

Configure(){
    show_menus() {
    clear
    tput setaf 2
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"    
    echo "  C O N F I G U R A T I O N"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "1. Install Required Packages"
    echo "2. Setup Google Source"
    echo "3. Create ROM Directory" 
    echo "4. Initialize Repo"
    echo "5. Setup CCache"
    echo "6. Exit"
}

read_options(){
    local choice
    read -p "Enter choice [ 1 - 6] " choice
    case $choice in
        1) Install_Required_Packages ;;
        2) Setup_Google_Source ;;
        3) Create_ROM_Directory ;;
        4) Initialize_Repo ;;
        5) Setup_CCache ;;
        6) exit 0;;
        *) echo -e "${RED}Error...${STD}" && sleep 2
    esac
}

Install_Required_Packages(){
    echo "Installing Packages"
    sudo apt-get install openjdk-8-jdk
    sudo apt-get update && sudo apt-get install git-core gnupg flex bison gperf libsdl1.2-dev libesd0-dev libwxgtk2.8-dev squashfs-tools build-essential zip curl libncurses5-dev zlib1g-dev openjdk-8-jre openjdk-8-jdk pngcrush schedtool libxml2 libxml2-utils xsltproc lzop libc6-dev schedtool g++-multilib lib32z1-dev lib32ncurses5-dev lib32readline-gplv2-dev gcc-multilib maven tmux screen w3m ncftp
    pause
    return
}   

Setup_Google_Source(){
    mkdir ~/bin
    PATH=~/bin:$PATH
    curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
    chmod a+x ~/bin/repo
    pause
    return
}

Create_ROM_Directory(){
    echo "Creating ROM Directory"
    mkdir ~/DirtyDragons
    pause
    return
}

Initialize_Repo(){
    echo "Initializing Repo"
    cd ~/DirtyDragons
    repo init -u https://github.com/KillerDroid96/platform_manifest.git -b N7
    pause
    return
}

Setup_CCache(){
    echo "export USE_CCACHE=1" >> ~/.bashrc
    ~/DirtyDragons/prebuilts/misc/linux-x86/ccache/ccache -M 100G
    pause
    return
}   
}

Cleaning(){
    show_menus() {
    clear
    tput setaf 2
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo " A D V A N C E D  C L E A N I N G"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "1.  Clean"
    echo "2.  Clobber"
    echo "3.  Novo"
    echo "4.  Magic"
    echo "5.  Dirty"
    echo "6.  Apps" 
    echo "7.  Image"
    echo "8.  Kernel"
    echo "9.  Recovery"
    echo "10. Root"
    echo "11. Data"
    echo "12. Install"
    echo "13. CCache"
    echo "14. Exit"    
}

read_options(){
    local choice
    read -p "Enter choice [ 1 - 14] " choice
    case $choice in
        1) Clean ;;
        2) Clobber ;;
        3) Novo ;;
        4) Magic ;;
        5) Dirty ;;
        6) Apps ;;
        7) Image ;;
        8) Kernel ;;
        9) Recovery ;;
        10) Root ;;
        11) Data ;;
        12) Install ;;
        13) CCache ;;
        14) exit 0 ;;
        *) echo -e "${RED}Error...${STD}" && sleep 2
    esac
}

Clean(){
    echo "Start Fresh"
    pause
    make clean
    pause
    return
}

Clobber(){
    echo "Make Clean"
    pause
    make clobber
    pause
    return
}

Novo(){
    echo "This should be almost as good as a clobber but keeping many of the time intensive files"
    pause
    make novo
    pause
    return
}

Magic(){
    echo "This is one step better then Novo, only clearing target/product"
    pause
    make magic
    pause
    return
}

Dirty(){
    echo "Clears out zip and build.prop"
    pause
    make dirty
    pause
    return
}

Apps(){
    echo "Clears out all apks"
    pause
    make appclean
    pause
    return
}

Image(){
    echo "Clears out all .img files"
    pause
    make imagclean
    pause
    return
}

Kernel(){
    echo "Clears out all kernel stuff"
    pause
    make kernelclean
    pause
    return
}

System(){
    echo "Clears out all system stuff"
    pause
    make systemclean
    pause
    return
}

Recovery(){
    echo "Clears out all recovery stuff"
    pause
    make recoveryclean
    pause
    return
}

Root(){
    echo "Clears out all root stuff"
    pause
    make rootclean
    pause
    return
}

Data(){
    echo "Clears out all data stuff"
    pause
    make dataclean
    pause
    return
}

Install(){
    echo "Clears out all install stuff"
    pause
    make installclean
    pause
    return
}

CCache(){
    echo "Clears out all CCache"
    pause
    ccache -C
    pause
    return
}
}

# ----------------------------------------------
# Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
# trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Main logic - infinite loop
# ------------------------------------
while true
do
    show_menus
    read_options 
done

