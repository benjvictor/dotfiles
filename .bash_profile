#this is to set up a new bash rc file

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "[$RETVAL] "
}

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo " [${BRANCH}${STAT}]"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

# custom path for vendasta box
PATH=$PATH:$HOME/google-cloud-sdk/bin
PATH=$PATH:/usr/local/mysql/bin
# Add Visual Studio Code (code)
PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH
export GO111MODULE=auto

export VIMINIT='source $MYVIMRC'
export MYVIMRC='~/dotfiles/.vimrc'
export EDITOR=vim
export SCPSSH="scp bvh895@tuxworld.usask.ca:/student/bvh895/"
export PS1="\[\e[31m\]\`nonzero_return\`\[\e[m\]\[\e[0;32m\]\A\[\e[m\] \h:\[\e[0;36m\]\W\[\e[m\]\[\e[32m\]\`parse_git_branch\`\[\e[m\]\n\[\e[31m\]♥\[\e[m\] "
#export SvnPrj=$SvnURL/time_calc;

# run tmux at start of each window
#if [[ -z "$TMUX" ]]; then
#	tmux
#fi

echo "hello Benj, welcome to the Matrix"

#===================
# Personnal Aliases
#===================
alias ls="ls -pG"
alias hs="history | grep"
alias sshusask="ssh bvh895@tuxworld.usask.ca"
alias gc="gcloud"
alias bashrc="~/.bash_profile"
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias fuck)

#===================
# Vendasta Aliases
#===================
#alias wspctl="docker run --rm -it -v ~/.config/gcloud:/.config/gcloud -v /var/run/docker.sock:/var/run/docker.sock -v ~/Projects/website-pro:/website-pro gcr.io/repcore-prod/website-pro/wspctl"
#alias invfuck="inv pylint -f pylint_test -f test"
invfuck() {
	if [ $# -eq 0 ]; then
		inv pylint -f
		inv pylint_test -f
		inv test
	fi
}

# Get current weather, with option of giving town as arg
#alias weather="curl wttr.in"
weather() {
	if [ $# -eq 0 ]; then
		curl wttr.in
	else
		curl wttr.in/~$1
	fi
}

mkpdf() {
	if [ $# -eq 1 ]; then
		filename=$1
		pdflatex $filename
		open "${filename%.*}.pdf"
	fi
}

export PATH="/usr/local/opt/ant@1.9/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
