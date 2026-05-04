-- nixd config. The killer feature is option completion: typing
-- `services.|` inside a NixOS module pops up the full options list, with
-- types and docstrings, evaluated against THIS flake's actual config.
--
-- The `expr` strings below are evaluated by nixd via `nix-instantiate`
-- under the hood, so:
--   - `<nixpkgs>` resolves through the system NIX_PATH (set on NixOS by
--     default — `nix-channel --list` or `$NIX_PATH` to verify).
--   - `getFlake` requires `experimental-features = nix-command flakes`
--     in nix.conf — already set in modules/nixos/common.nix.
return {
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "nixfmt" },
      },
      options = {
        nixos = {
          expr = '(builtins.getFlake "/home/davide/nixos-config").nixosConfigurations.hydrogen.options',
        },
        home_manager = {
          expr = '(builtins.getFlake "/home/davide/nixos-config").nixosConfigurations.hydrogen.options.home-manager.users.type.getSubOptions []',
        },
      },
    },
  },
}
