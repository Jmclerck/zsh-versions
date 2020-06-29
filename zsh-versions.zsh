autoload -U colors && colors

function versions() {
  local icons=''

  if [[ $DENO_VERSION == true ]]; then
    local version=$(deno --version | rg -o "deno (\d*\.\d*\.\d*)" -r '$1') &> /dev/null
    icons="$icons  $version" 
  fi

  if [[ $DOCKER_VERSION == true ]]; then
    local version=$(docker --version | rg -o "\d*\.\d*\.\d*") &> /dev/null
    icons="$icons %{$fg[cyan]%} $version%{$reset_color%}"
  fi

  if [[ $NODE_VERSION == true ]]; then
    local version=$(node --version | rg -o "\d*\.\d*\.\d*") &> /dev/null
    icons="$icons %{$fg[green]%} $version%{$reset_color%}"
  fi

  if [[ $NPM_VERSION == true ]]; then
    local version=$(npm --version) &> /dev/null
    icons="$icons %{$fg[red]%} $version%{$reset_color%}"
  fi

  if [[ $PYTHON_VERSION == true ]]; then
    local version=$(python --version | rg -o "\d*\.\d*\.\d*") &> /dev/null
    icons="$icons %{$fg[yellow]%} $version%{$reset_color%}"
   fi

  if [[ $RUBY_VERSION == true ]]; then
    local version=$(ruby --version | rg -o "\d*\.\d*\.\d*") &> /dev/null
    icons="$icons %{$fg[red]%} $version%{$reset_color%}"
  fi

  if [[ $YARN_VERSION == true ]]; then
    local version=$(yarn --version) &> /dev/null
    icons="$icons %{$fg[blue]%} $version%{$reset_color%}"
  fi

  print $icons
}