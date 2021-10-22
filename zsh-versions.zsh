autoload -U colors && colors

function versions() {
  local icons=()


  if [[ $ZSH_NODE_VERSION == true ]]; then
    local version=$(node --version | grep -o "\d*\.\d*\.\d*") &> /dev/null
  
    if [[ -n $version ]]; then
      icons+=("%{$fg[green]%} $version%{$reset_color%}")
    fi
  fi

  if [[ $ZSH_NPM_VERSION == true ]]; then
    local version=$(npm --version) &> /dev/null
    
    if [[ -n $version ]]; then
      icons+=("%{$fg[red]%} $version%{$reset_color%}")
    fi
  fi

  if [[ $ZSH_YARN_VERSION == true ]]; then
    local version=$(yarn --version) &> /dev/null

    if [[ -n $version ]]; then
      icons+=("%{$fg[cyan]%} $version%{$reset_color%}")
    fi
  fi

  print $icons
}