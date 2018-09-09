{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		# other
		git
		#clang
		#llvm
		lld

		idris
		#rustc
		#cargo
	];
}
