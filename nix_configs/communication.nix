{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		teamspeak_client
	];
}
