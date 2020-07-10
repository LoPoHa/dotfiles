{ config, pkgs, ... }:
let
  all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};
in
{
	environment.systemPackages = with pkgs; [
		# other
		git
		git-lfs
		#pijul
		#clang
		#llvm
		lld

		vscode
	];
}
