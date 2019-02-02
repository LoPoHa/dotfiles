
{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		# other
		git
		pijul
		#clang
		#llvm
		lld

		gmp
		idris
        idrisPackages.contrib
        idrisPackages.pruviloj
	];
}
