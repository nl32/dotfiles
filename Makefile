ACTIVATION_USER ?= ${USER}
ACTIVATION_HOST ?= $(shell hostname)

.PHONY: switch
switch:
	nix run . -- switch --flake .#"${ACTIVATION_USER}@${ACTIVATION_HOST}"

.PHONY: build
build:
	nix run . -- build --flake .#"${ACTIVATION_USER}@${ACTIVATION_HOST}"
