#!/usr/bin/env bash

runLazygit() {
	#check if lazygit is installed
	if command -v lazygit >/dev/null 2>&1; then
		if [[ "$1" == "newSession" ]]; then
			echo "[tmux: session] creating new session"
			tmux new-session -s $session_name -c $dir lazygit
			exit 0
		else
			echo "[tmux: window] creating new window"
			tmux new-window lazygit
			exit 0
		fi
	else
		echo "command not found: lazygit"
		exit 0
	fi
}

#check if tmux is installed
if command -V tmux >/dev/null 2>&1; then
	#check if tmux is running
	tmux_running=$(pgrep tmux)
	if [[ -z $tmux_running ]]; then
		dir=$(pwd)
		base=$(basename $dir | tr . _)
		branch=$(git symbolic-ref --short HEAD)
		session_name=$base"_"$branch

		#tmux isn't running
		#create ne session instead
		runLazygit "newSession"
	else
		#tmux is running
		#create new window instead
		runLazygit "newWindow"
	fi
else
	echo "command not found: tmux"
	exit 0
fi
