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
				    set nocompatible
					set showmode
					set nowrap
					set expandtab
					set autoindent
					set copyindent
					set ignorecase
					set smartcase
					set smarttab
					set scrolloff=4
					set hidden
					set tabstop=4
					set shiftwidth=4
					set number
					set hls!
					set virtualedit=all

					nnoremap <Tab> %
					vnoremap <Tab> %
					
					nnoremap ; :
					map! <F1> <ESC>


					let g:neomake_echo_current_error = 1
					let g:neomake_verbose = 0
				'';
			};
		})
	];
}
