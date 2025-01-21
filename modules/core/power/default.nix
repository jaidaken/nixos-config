{self, pkgs, libs, inputs, ...}:
{
  environment.systemPackages = with pkgs; [
    acpi
  ];
  powerManagement.enable = true;

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 100;

     #Optional helps save long term battery health
     START_CHARGE_THRESH_BAT0 = 65; # and below it starts charge
     STOP_CHARGE_THRESH_BAT0 = 90; # and above it stops charging

      };
  };
}
