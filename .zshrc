############################
# ENVIORNMENT VARIABLES
############################
export TWILIO_ACCOUNT_SID="ACa18f9775ef0fba984ed00746126c223e"
export TWILIO_AUTH_TOKEN="2176fd76b8bfd0144c9764bc39c3f130"
export TWILIO_PHONE_NUMBER="+12059003194"
export CELL_PHONE_NUMBER="+19095481722"
export EMAIL_ADDRESS="ma.austin.1028@gmail.com"
export EMAIL_PASSWORD="Fjb8ny#c5pi"
export CUTTLY_KEY="67739978693696a200f2af7768effbee"
export TINYPNG_KEY="ggMZBvWKHCng3JPqKdxMblwtWRMdx1gm"

export RED=`tput setaf 1`
export PINK=`tput setaf 5`
export BLUE=`tput setaf 4`
export YELLOW=`tput setaf 3`
export RESET=`tput sgr0`
export gettime=(date +"%H:%M:%S")
export DEFAULT_BROWSER="Google Chrome"
export DEFAULT_PORT="8000"
#ZSH Path
export ZSH="$HOME/.oh-my-zsh"

# ZSH THEME
ZSH_THEME="agnoster"
0="zsh"

# Set variable to prevent user@hostname from appearing
DEFAULT_USER=`whoami`


# Set ZSH Auto-update frequency (days)
export UPDATE_ZSH_DAYS=13

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh


############################
# User configuration
############################

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi


# Compilation flags
# ie: export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias spotify="open -a Spotify"
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
alias cl="clear; lr"
alias config="vim ~/.zshrc"
alias reload="source ~/.zshrc"
alias restart="exec $SHELL"
alias lt="ls -1Shl | tail -n +2"
alias lr="ls -hltur | tail -n +2"
alias ping="ping -c 5"
alias ipe="curl ipinfo.io/ip"
alias ipi="ipconfig getifaddr en0"
alias mnt="mount | grep -E ^/dev | column -t"
alias gh="history|grep"

openLinks(){
	cat $HOME/Scripts/links.txt | \
	while read URL; do
		open -a "${DEFAULT_BROWSER}" "${URL}"
	done
}
mcd () {
	mkdir -p "$1"
	cd "$1"
}

function google(){
	searchQuery=( "$@" )
	printf -v formattedQuery '+%s' "${searchQuery[@]}"
	formattedQuery=${formattedQuery:1}
	open -a "${DEFAULT_BROWSER}" "http://google.com/search?q=${formattedQuery}"
	echo "Google search initiated for query - \"${searchQuery}\""
}
function www(){
	port_to_use=$DEFAULT_PORT
	if [[ "$1" ]];
        	then
            	port_to_use=$1
    fi	
	python -m SimpleHTTPServer port_to_use
}
surf() {
	common_websites=(facebook gmail youtube reddit instagram netflix amazon twitter)
	browsers=(firefox opera)
	browser_to_use=${DEFAULT_BROWSER}
	if [[ " ${browsers[*]} " == *"$1"* ]];
	then
		browser_to_use=$1
		shift
	fi
	declare -A array
	# Create associative array, which checks for inclusion
	for site in $common_websites
		do
			array[$site]="http://${site}.com"
		done

	# Open files / links, depending on inclusion associative array
	for link in "$@"
		if [[ ${array[$link]} ]]; then 
			echo "Opening $array[$link]"
			open -a "${browser_to_use}" $array[$link]
		else
			echo "Opening ${PWD}/${link}"
			open -a "${browser_to_use}" "${link}"
		fi
}
echo "At your humble service."