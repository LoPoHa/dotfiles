{ config, pkgs, ... }:
{
	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.extraUsers.lopoha = {
		name = "lopoha";
		description = "LoPoHa";
		group = "users";
		extraGroups = [
			"wheel"
			"disk"
			"audio"
			"video"
			"fuse"
		];
		isNormalUser = true;
		createHome = true;
		home = "/home/lopoha";
		shell = "/run/current-system/sw/bin/zsh";
		uid = 1000;
	};
}
