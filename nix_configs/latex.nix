{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
        texstudio
		(texlive.combine {
            inherit (texlive) scheme-full collection-langgerman algorithms cm-super;
		})
	];
}
