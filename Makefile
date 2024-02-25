ACTIVATION_USER ?= ${USER}
ACTIVATION_HOST ?= $(shell hostname)

.PHONY: home-switch
home-switch:
	nix run "github:nix-community/home-manager#home-manager" -- switch --flake .#"${ACTIVATION_USER}@${ACTIVATION_HOST}"
.PHONY: system-switch
system-switch:
	sudo nixos-rebuild switch --flake .#"${ACTIVATION_HOST}"
