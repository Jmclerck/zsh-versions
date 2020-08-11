autoload -U colors && colors

function versions() {
  local icons=()

  if [[ $ZSH_DENO_VERSION == true ]]; then
    local version=$(deno --version | rg -o "deno (\d*\.\d*\.\d*)" -r '$1') &> /dev/null
  
    if [[ -n $version ]]; then
      icons+=("%{$reset_color%} $version")
    fi
  fi

  if [[ $ZSH_DOCKER_VERSION == true ]]; then
    local version=$(docker --version | rg -o "\d*\.\d*\.\d*") &> /dev/null
    if [[ -n $version ]]; then
      icons+=("%{$fg[cyan]%} $version%{$reset_color%}")
    fi
  fi

  if [[ $ZSH_NODE_VERSION == true ]]; then
    local version=$(node --version | rg -o "\d*\.\d*\.\d*") &> /dev/null
  
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

  if [[ $ZSH_PYTHON_VERSION == true ]]; then
    local version=$(python3 --version | rg -o "\d*\.\d*\.\d*") &> /dev/null

    if [[ -n $version ]]; then
      icons+=("%{$fg[yellow]%} $version%{$reset_color%}")
     fi
  fi

  if [[ $ZSH_RUBY_VERSION == true ]]; then
    local version=$(ruby --version | rg -o "\d*\.\d*\.\d*") &> /dev/null
    
    if [[ -n $version ]]; then
      icons+=("%{$fg[red]%} $version%{$reset_color%}")
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