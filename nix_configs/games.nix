{ config, pkgs, ... }:
{
	# required for steam games
	hardware.opengl.driSupport32Bit = true;
	hardware.pulseaudio.support32Bit = true;

	environment.systemPackages = with pkgs; [
		steam
		freeciv
	];
}
