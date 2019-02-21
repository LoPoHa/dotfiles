{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		# other
		git
		pijul
		#clang
		#llvm
		lld

        (idrisPackages.with-packages (with idrisPackages; [
            contrib
            pruviloj
        ]))
	];
}
