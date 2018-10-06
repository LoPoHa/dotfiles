{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		# other
		git
		#clang
		#llvm
		lld

		idris
		openjdk
		#rustc
		#cargo
        nim

        cabal2nix
        nix-prefetch-git
        cabal-install
        stack
        zlib
        pkgconfig

	    atom
	];
}
