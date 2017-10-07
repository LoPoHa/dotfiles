{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		# other
		git
		clang
		llvm
		lld
		#rustc
		#cargo
	];
}
