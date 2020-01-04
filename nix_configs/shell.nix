{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		oh-my-zsh
	];

	# shell
	programs.zsh.enable = true;
	users.defaultUserShell = "/run/current-system/sw/bin/zsh";

	# enable oh-my-zsh
	programs.zsh.interactiveShellInit = ''
		export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
		
		ZSH_THEME="agnoster"

		# set nvim as standard editor
		export EDITOR='nvim'
		export VISUAL='nvim'

		HISTFILE=~/.zhistory
		HISTSIZE=SAVEHIST=15
		setopt sharehistory
		setopt extendedhistory
		
		# export cargo path
		export PATH="$PATH:$HOME/.cargo/bin"
		export PATH="$PATH:$HOME/.own_programs"

		#disable caps lock
		setxkbmap -option ctrl:nocaps
		
		source $ZSH/oh-my-zsh.sh
	'';

	programs.zsh.promptInit = "";
}

