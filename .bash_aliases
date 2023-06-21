alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls --human-readable --size -1 -S --classify'

alias c='clear'
alias downloads='cd ~/Downloads/'
alias update='sudo apt update && apt list --upgradable'
alias upgrade='sudo apt upgrade -y'

alias gs='git status'
alias gss='git status -s'
alias gl='git log --graph --decorate --pretty=oneline --abbrev-commit'
alias gaa='git add .'
alias gcm='git commit -m'
alias gcma='git add . && git commit -m'
alias gup='git add . && git commit -m "Up: $(date +"%F %T")"'
alias gco='git checkout'
alias gb='git branch'
alias gg='git pull'
alias gp='git push'

alias nvim='nvim.appimage'
alias vi='nvim'
alias vis='nvim -S'

alias nd='npm run dev'
alias no='npm outdated'
alias pn=pnpm
alias pno='pnpm outdated'

alias goose='/home/diogenes/code/diogenes/_go/goose/goose'
