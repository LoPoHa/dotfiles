{ config, pkgs, ... }:
{
	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.extraUsers.christian = {
		name = "christian";
		description = "Christian Dereck";
		group = "users";
		extraGroups = [
			"wheel"
			"disk"
			"audio"
			"video"
			"systemd-journal"
			"vboxuser"
		];
		isNormalUser = true;
		createHome = true;
		home = "/home/christian";
		shell = "/run/current-system/sw/bin/zsh";
		uid = 1000;
	};
}
