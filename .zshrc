# Report the branch when in a directory that's a git repository
# parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
# }

source ~/omz-init.sh
source ~/device-specific.sh

parse_npm_versions() {
local input

if [ -t 0 ]; then
    input="$1"
else
    input=$(cat)
fi

echo "$input" | sed -n '/^dist-tags:/,/^$/p' | tail -n +2 | sed 's/^[[:space:]]*/  /'
}

version_pf() {
package_name=""
full_flag=""
all_flag=""
prerelease_flag=""
latest_flag=""
tag=""

while getopts n:faplt: flag; do
    case $flag in 
        n) package_name="${OPTARG}" ;;
        f) full_flag='true' ;;
        a) all_flag='true' ;;
        p) prerelease_flag='true' ;;
        l) latest_flag='true' ;;
        t) tag="${OPTARG}" ;;
  esac
done

npm_response=$(npm view @patternfly/$package_name)

if [[ -n $full_flag ]];
    then
        echo $npm_response
    else
        echo -n "$package_name:\n"
        versions=$(echo $npm_response | parse_npm_versions)
        if [[ -n $all_flag ]]
        then echo $versions
        elif [[ -n $prerelease_flag ]]
        then echo $versions | grep "prerelease:"
        elif [[ -n $latest_flag ]]
        then echo $versions | grep "latest:"
        elif [[ -n $tag ]]
        then echo $versions | grep "$tag:"
        fi
fi
}

version_pf_all() {
    flags='-f'

    while getopts aplt: flag; do
        case $flag in 
            a) flags='-a' ;;
            p) flags='-p' ;;
            l) flags='-l' ;;
            t) flags="-t ${OPTARG}" ;;
        esac
    done

    version_pf -n patternfly $flags
    version_pf -n react-charts $flags
    version_pf -n react-code-editor $flags
    version_pf -n react-core $flags
    version_pf -n react-drag-drop $flags
    version_pf -n react-icons $flags
    version_pf -n react-styles $flags
    version_pf -n react-table $flags
    version_pf -n react-templates $flags
    version_pf -n react-tokens $flags
}

export NODE_OPTIONS=--max-old-space-size=10000

# setopt PROMPT_SUBST

# PROMPT='%F{green}%~%f%F{yellow}$(parse_git_branch) $%f '

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" # This adds `code` to the PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias cpa='code ~/repos/patternfly-analytics'
alias cpc='code ~/repos/patternfly'
alias cpcm='code ~/repos/pf-codemods'
alias cpced='code ~/repos/pf-extension-docs'
alias cpd='code ~/repos/pf-docs'
alias cpes='code ~/repos/patternfly-extension-seed'
alias cpo='code ~/repos/patternfly-org'
alias cpq='code ~/repos/patternfly-quickstarts'
alias cpr='code ~/repos/patternfly-react'
alias cprs='code ~/repos/patternfly-react-seed'
alias crc='code ~/repos/react-console'
alias crt='code ~/repos/react-topology'
alias crcv='code ~/repos/react-catalog-view'
alias crlv='code ~/repos/react-log-viewer'
alias cs='code ~/repos/setup'
alias cz='code ~/repos/setup/.zshrc'

alias gaa='git add .'
alias gb='git switch'
alias gbm='git switch main'
alias gb6='git switch v6'
alias gc='git commit'
alias gca='git commit --amend'
alias gclean='git stash --include-untracked && git clean -xdf && yarn'
alias gclean--no-save='git clean -xdf && yarn'
alias gf='git fetch upstream'
alias gitPurgeBranches='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'
alias gl='git log'
alias gmb='git switch -c'
alias gp='git push'
alias gpl='git pull'
alias gpo='git push -u origin'
alias gra='git remote add'
alias grc='git rebase --continue'
alias grh='git reset --hard'
alias grhc='git reset --hard && git clean -xdf'
alias grv='git remote -v'
alias grum='git rebase upstream/main'
alias gru5='git rebase upstream/v5'
alias grab='git rebase --abort'
alias gs='git status'
alias gsp='git stash pop'
alias gst='git stash --include-untracked'

alias ghb='gh browse'
alias ghpc='gh pr create -fw'
alias ghpco='gh pr checkout'
alias ghpc6='gh pr create -B "v6" -fw'
alias ghps='gh pr status'
alias ghrsd='gh repo set-default'

alias nr='npm run'
alias npmv='npm view'

alias pn='pnpm'
alias pi='pnpm install'
alias pr='pnpm run'

alias yb='yarn build'
alias ybd='yarn build:docs'
alias yci='git clean -xdf && yarn'
alias yjw='yarn jest --watch'
alias ys='yarn start'
alias ysd='yarn serve:docs'
alias yt='yarn test'
alias ytsf='yarn test:v5:single --fix'

alias lza='cat ~/.zshrc | grep alias'
alias lzag='lza | grep git'
alias lzagh='lza | grep gh'
alias lzac='lza | grep code'
alias lzan='lza | grep npm'
alias lzay='lza | grep yarn'
alias lzaz='lza | grep lza || zsh'
alias sz='cp ~/repos/setup/.zshrc ~/.zshrc && source ~/.zshrc'

autoload -Uz compinit && compinit
