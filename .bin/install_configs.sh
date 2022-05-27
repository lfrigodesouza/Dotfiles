#    __    ___________   _   ______________
#   / /   / ____/ ___/  / | / / ____/_  __/
#  / /   / /_   \__ \  /  |/ / __/   / /
# / /___/ __/  ___/ / / /|  / /___  / /
#/_____/_/    /____(_)_/ |_/_____/ /_/
# https://LFrigoDeSouza.NET
# https://github.com/lfrigodesouza/Dotfiles
# 
# Installation file to setup a new environment with all dotfiles
# or to update existing dotfiles from the repository

# Clone the repository to the home directory if it does not exist
if [[ ! -d $HOME/.cfg ]]; then
    git clone --bare https://github.com/lfrigodesouza/Dotfiles $HOME/.cfg
fi

# Create the config function that will be used in this installation to refer to the repository
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

# Checkout repository files
config checkout

# If the checkout fails it's possible that some of the config files
# already exists on the home directory
# For each file that generates a conflict, move it to the backup folder
if [ $? = 0 ]; then
    echo "Checked out config files";
else
    # Create a backup folder for the existing config files
    mkdir -p .config-backup
    CURRDATE=`date +%Y%m%dT%H%M%S`
    mkdir -p .config-backup/${CURRDATE}
    echo "Backing up pre-existing dotfiles";
    # Move existing config files to the backup folder
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/${CURRDATE}/
fi;

echo "Checking out config files again after backup";
# Checkout the files again
config checkout -f

# Sets the repository to not show untracked files.
# Otherwise, all files on the home directory would appear
config config status.showUntrackedFiles no
