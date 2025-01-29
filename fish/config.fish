if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -g fish_greeting
starship init fish | source
export "MICRO_TRUECOLOR=1"
#~/.config/fish/terminal_sunday.sh 2007-07-27 Luyu

# MY ALIASES

function hyprconfs
	cd ~/.config/hypr/
	ls -la
end

function fishconfs
	cd /home/ip/.config/fish/
	vim config.fish
end

function my_aliases
	vim ~/Documents/"INFO TXTS"/MY_ALIASES.txt
end

function ejectBackup
	sudo umount /dev/sdc1
	udiskctl power-off -b /dev/sdc1
end

