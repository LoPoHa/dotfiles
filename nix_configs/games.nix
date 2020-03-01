{ config, pkgs, ... }:
{
    nixpkgs.config.retroarch = {
        enableMGBA = true;
    };
    
	environment.systemPackages = with pkgs; [
		steam
		retroarch
        wine-staging
        lutris
	];
}
