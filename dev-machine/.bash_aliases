alias ll='ls -a -l'
alias temp='vcgencmd measure_temp'
alias mkcd='function _mkcd() { mkdir -p "$1" && cd "$1"; }; _mkcd'

alias pyvenv='virtualenv -q ./venv/ && source ./venv/bin/activate && if [ -f ./requirements.txt ]; then pip3 install -q -r ./requirements.txt; fi'
alias vscode='code serve-web --host 192.168.0.210 --port 8080 --without-connection-token > /dev/null 2>&1 &'
