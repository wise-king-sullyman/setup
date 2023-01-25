# Report the branch when in a directory that's a git repository
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export NODE_OPTIONS=--max-old-space-size=10000

setopt PROMPT_SUBST

PROMPT='%F{green}%~%f%F{yellow}$(parse_git_branch) $%f '

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" # This adds `code` to the PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Puppeteer setup for pf docs framework testing
# echo 'export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true' >> ~/.zshrc
# echo 'export PUPPETEER_EXECUTABLE_PATH=`which chromium`' >> ~/.zshrc
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

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
alias crcv='code ~/repos/react-catalog-view'
alias crlv='code ~/repos/react-log-viewer'
alias cs='code ~/repos/setup'
alias cz='code ~/repos/setup/.zshrc'

alias gaa='git add .'
alias gb='git switch'
alias gc='git commit'
alias gca='git commit --amend'
alias gclean='git stash --include-untracked && git clean -xdf && yarn'
alias gf='git fetch upstream'
alias gitPurgeBranches='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'
alias gl='git log'
alias gmb='git switch -c'
alias gp='git push'
alias gpl='git pull'
alias gpo='git push -u origin'
alias gra='git remote add'
alias grc='git rebase --continue'
alias grv='git remote -v'
alias grum='git rebase upstream/main'
alias grab='git rebase --abort'
alias gs='git status'
alias gsp='git stash pop'
alias gst='git stash --include-untracked'

alias ghb='gh browse'
alias ghpc='gh pr create -fw'
alias ghpcs='gh pr checkout'
alias ghps='gh pr status'
alias ghrsd='gh repo set-default'

alias yb='yarn build'
alias ybd='yarn build:docs'
alias ys='yarn start'
alias ysd='yarn serve:docs'
alias yt='yarn test'

alias lza='cat ~/.zshrc | grep alias'
alias lzag='lza | grep git'
alias lzagh='lza | grep gh'
alias lzac='lza | grep code'
alias lzay='lza | grep yarn'
alias lzaz='lza | grep lza || zsh'
alias sz='cp ~/repos/setup/.zshrc ~/.zshrc && source ~/.zshrc'

autoload -Uz compinit && compinit

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# DONT PUT THINGS BELOW HERE
