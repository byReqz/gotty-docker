#!/bin/bash

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
	apt-get update
	apt-get install $pkgs
fi
if [ -z "$command" ];then
	apt-get update
	apt-get install figlet
	command="curl -s https://raw.githubusercontent.com/dylanaraps/pfetch/master/pfetch | bash && figlet no command set && read swag"
fi

/gotty -p "$port" $creds --title-format "$title" tmux new-session -A -s "$title" "$command"

