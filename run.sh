#!/bin/ash

if [ -z "$port" ];then
	port=8080
fi
if [ -n "$userpass" ];then
	creds="-c "$userpass""
fi
if [ -z "$title" ];then
	title=gotty
fi
if [ -n "$pkgs" ];then
	apk update
	apk add $pkgs
fi
if [ -z "$command" ];then
	apk update
	apk add pfetch figlet
	command="pfetch && figlet no command set"
fi

./gotty -p "$port" $creds --title-format "$title" tmux new-session -A -s $command "$title"
