{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		lmms
		lv2
		audacity
	];
}
