humdrum-nix
============

packaging and building humdrum for nix

About
-----

The [Humdrum toolkit](https://www.humdrum.org/) is a set of resources for
computational music analysis.
This project packages the toolkit to be installed with the [nix](https://nixos.org) package manager

Usage
-----

If you are not using the `nix` package manager, you should follow the instructions in the
[humdrum tools](https://github.com/humdrum-tools/humdrum-tools) repo instead.

To install with nix, first clone the repo, and then use `nix-env` to install:

```
git clone https://github.com/tshaynik/humdrum-nix.git
cd humdrum-nix
nix-env -f default.nix -i
```
