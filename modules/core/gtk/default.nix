{ pkgs, inputs, ...}:
{
  environment.systemPackages = with pkgs; [
    inputs.nixos-conf-editor.packages.${system}.nixos-conf-editor
  ];
}
