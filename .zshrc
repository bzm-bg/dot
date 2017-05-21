export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

export PATH=/usr/sbin:$PATH
export PATH=/usr/local/bin:$PATH

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history
autoload -U compinit
compinit

export LANG=ja_JP.UTF-8

autoload colors
colors

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}+"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}-"
zstyle ':vcs_info:*' actionformats \
        '%F{5}[%F{2}%b%F{7}:%F{6}%r%F{3}|%F{1}%a%F{5}]%f'
zstyle ':vcs_info:*' formats \
        '%F{5}[%F{2}%c%u%b%F{7}:%F{6}%r%F{5}]%f'
zstyle ':vcs_info:*' enable git

vcs_info_wrapper() {
	vcs_info
	if [ -n "$vcs_info_msg_0_" ]; then
		echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
	fi
}
PROMPT="%{${fg[red]}%}[%n@%m]%{${reset_color}%} %~
%# "
RPROMPT=$'$(vcs_info_wrapper)'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -G'
alias ll='ls -la -G'
export LSCOLORS=gxfxcxdxbxegedabagacad
alias sed='gsed'

