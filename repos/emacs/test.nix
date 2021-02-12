{ pkgs ? import <nixpkgs> { overlays = [ (import ../../default.nix) ]; } }:

let
  mkTestBuild = package: let
    emacsPackages = pkgs.emacsPackagesNgGen package;
    emacsWithPackages = emacsPackages.emacsWithPackages;
  in emacsWithPackages(epkgs: [ ]);

in {
  emacsUnstable = mkTestBuild pkgs.emacsUnstable;
  emacsGit = mkTestBuild pkgs.emacsGit;
  emacsPgtk = mkTestBuild pkgs.emacsPgtk;
  emacsPgtkGcc = mkTestBuild pkgs.emacsPgtkGcc;
  emacsNg = mkTestBuild pkgs.emacsNg;
  emacsNgGcc = mkTestBuild pkgs.emacsNgGcc;
}
