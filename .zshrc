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

alias gaa='git add .'
alias gb='git switch'
alias gc='git commit'
alias gf='git fetch upstream'
alias gitPurgeBranches='git branch --merged | egrep -v "(^\*|master|main|dev)" | xargs git branch -d'
alias gmb='git switch -c'
alias gp='git push'
alias gpl='git pull'
alias gpo='git push -u origin'
alias gra='git remote add'
alias grv='git remote -v'
alias grum='git rebase upstream/main'
alias gs='git status'
alias gsp='git stash pop'
alias gst='git stash --include-untracked'

alias ghb='gh browse'
alias ghpc='gh pr create -fw'
alias ghps='gh pr status'

alias yb='yarn build'
alias ybd='yarn build:docs'
alias ys='yarn start'
alias ysd='yarn serve:docs'
alias yt='yarn test'

alias cz='code ~/.zshrc'
alias lza='cat ~/.zshrc | grep alias'
alias sz='source ~/.zshrc'

autoload -Uz compinit && compinit

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# DONT PUT THINGS BELOW HERE
