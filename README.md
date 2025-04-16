# NixOS-based live OS Template

## Usage

Build configuration into an ISO image:
```
$ nix build
```

Built ISO will be in `./result/iso/`.

Build configuration into a test VM:
```
$ nix build .#vm
```

Run test VM:
```
$ nix run .#vm
```

Update flake inputs to latest stable nixpkgs:
```
$ nix flake update
```
