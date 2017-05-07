{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		# other
		git
		#rustc
		#cargo
	];
}
