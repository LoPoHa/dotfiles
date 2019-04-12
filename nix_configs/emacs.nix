{ pkgs ? import <nixpkgs> {} }: 

let
  myEmacs = pkgs.emacs;
  emacsWithPackages = (pkgs.emacsPackagesNgGen myEmacs).emacsWithPackages;
in
  emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [
  ]) ++ (with epkgs.melpaPackages; [
    #undo-tree      # ; <C-x u> to show the undo tree
    #zoom-frm       # ; increase/decrease font size for all buffers %lt;C-x C-+>
    evil
    nix-mode
    use-package
    magit
    evil-magit
    idris-mode
    ponylang-mode
  ]) ++ (with epkgs.elpaPackages; [
    org
  ]) ++ [
  ])
