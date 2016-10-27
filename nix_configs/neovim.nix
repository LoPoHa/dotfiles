{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		(neovim.override {
			configure = {
				vam = {
					knownPlugins = vimPlugins;
					pluginDictionaries = [
						{ name = "rust-vim"; }
						{ name = "neomake"; }
					];
				};
				
				customRC = ''
					set hidden
					set tabstop=4
					set shiftwidth=4
					set number
					set hls!

					map <C-j> <C-W>j
					map <C-k> <C-W>k
					map <C-h> <C-W>h
					map <C-l> <C-W>l

					let g:neomake_echo_current_error = 1
					let g:neomake_verbose = 0
				'';
			};
		})
	];
}
