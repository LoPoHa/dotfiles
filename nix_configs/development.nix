{ config, pkgs, ... }:
let
  all-hies = import (fetchTarball "https://github.com/infinisil/all-hies/tarball/master") {};
in
{
	environment.systemPackages = with pkgs; [
		# other
		git
		git-lfs
	    gitkraken
		#pijul
		#clang
		#llvm
		lld
	    linuxPackages.perf

		vscode
		atom
		nodejs-12_x

        python3
        #godot

        (idrisPackages.with-packages (with idrisPackages; [
            contrib
            effects
            pruviloj
        ]))

        #godot
	    #okteta

	    nodePackages.node2nix

	    #elmPackages.elm
	    #go

	    android-studio
	    jdk11

	    #idea.idea-community

	    rustc
	    cargo

	    bazel
	    gcc

	    unison-ucm
	];
}
