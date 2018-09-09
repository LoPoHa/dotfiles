{ config, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		(neovim.override {
			configure = {
				vam = {
					knownPlugins = vimPlugins;
					pluginDictionaries = [
						{ name = "idris-vim"; }
						{ name = "vim-hdevtools"; }
						{ name = "neco-ghc"; }
						{ name = "ale"; }
					];
				};
				
				customRC = ''
                    set tabstop=4                   "A tab is 4 spaces
                    set expandtab                   "Always uses spaces instead of tabs
                    set softtabstop=4               "Insert 4 spaces when tab is pressed
                    set shiftwidth=4                "An indent is 4 spaces
                    set shiftround                  "Round indent to nearest shiftwidth multiple

				    set nocompatible
					set showmode
					set nowrap
					set autoindent
					set copyindent
					set ignorecase
					set smartcase
					set smarttab
					set scrolloff=4
					set hidden
					set number
					set hls!
					set virtualedit=all

					nnoremap <Tab> %
					vnoremap <Tab> %
					
					nnoremap ; :
					map! <F1> <ESC>

					syntax on
					filetype on
					filetype plugin indent on

					let g:idris_indent_if = 3
					let g:idris_indent_case = 5
					let g:idris_indent_let = 4
					let g:idris_indent_where = 6
					let g:idris_indent_do = 3
					let g:idris_indent_rewrite = 8
				'';
			};
		})
	];
}
