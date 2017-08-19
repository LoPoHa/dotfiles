{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		lmms
		audacity
	];
}
