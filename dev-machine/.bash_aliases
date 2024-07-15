alias ll='ls -a -l'
alias temp='vcgencmd measure_temp'
alias mkcd='function _mkcd() { mkdir -p "$1" && cd "$1"; }; _mkcd'

alias pyvenv='virtualenv -q ./venv/ && source ./venv/bin/activate && if [ -f ./requirements.txt ]; then pip3 install -q -r ./requirements.txt; fi'
alias pyvenvdump='pip3 freeze > ./requirements.txt'
alias gdiff='git diff'
