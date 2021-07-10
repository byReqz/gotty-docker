#!/bin/sh

if [ -z "$port" ];then
	port=8080
fi
if [ -n "$userpass" ];then
	creds="-c "$userpass""
fi
if [ "$allow_write" == "true" ];then
	allow_write="-w"
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
	apk add figlet
	command="curl -s https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch | ash && figlet no command set && read swag"
fi

if [ "$use_tmux" == "false" ];then
	/gotty -p "$port" $allow_write $creds --title-format "$title" "$command"
else
	/gotty -p "$port" $allow_write $creds --title-format "$title" tmux new-session -A -s "$title" "$command"
fi