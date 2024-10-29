# Git related functions
delete_localonly_branches () {
  # Update local references and remove references to deleted remote branches
  git fetch -p

  # Loop through each local branch
  for branch in $(git branch --format "%(refname:short)"); do
    # Check if branch exists on origin
    if ! git show-ref --quiet refs/remotes/origin/$branch; then
      # If branch doesn't exist on origin, display message
      echo "Delete local $branch"
      # Force delete the local branch
      git branch -D $branch
    fi
  done
}

alias delete_localonly_branch="delete_localonly_branches"

# Automatically switch Node version when .nvmrc file is present
autoload -U add-zsh-hook

load-nvmrc() {
  # Get current node version
  local node_version="$(nvm version)"
  
  # Try to find .nvmrc file
  local nvmrc_path="$(nvm_find_nvmrc)"
  
  if [ -n "$nvmrc_path" ]; then
    # Get node version from .nvmrc
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    
    if [ "$nvmrc_node_version" = "N/A" ]; then
      # Install if version not available
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      # Switch version if different
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    # Revert to default if no .nvmrc
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

# Hook to run when changing directory
add-zsh-hook chpwd load-nvmrc

# Initial load
load-nvmrc

# Kill process running on a specified TCP port
killport() {
 if [ $# -eq 1 ]; then
   local pid=$(lsof -i tcp:$1 -t)
   
   if [ -n "$pid" ]; then
     echo "Killing process on port $1 (PID: $pid)"
     kill -9 $pid
   else
     echo "No process found on port $1"
   fi
 else
   echo "Please provide a port number"
   echo "Usage: killport 3000"
 fi
}