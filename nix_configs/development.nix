{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		# other
		git
		pijul
		#clang
		#llvm
		lld

		vscode
		elmPackages.elm
		nodejs

        (appimage-run.override { extraPkgs = p: with p; [ 
            libgpgerror
        ]; })

		ponyc
		pony-stable

        (idrisPackages.with-packages (with idrisPackages; [
            contrib
            effects
            pruviloj
        ]))
	];
}
