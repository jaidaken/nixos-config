{
programs.zsh = {
  enable = true;
  enableCompletion = true;
  autosuggestions.enable = true;
  syntaxHighlighting.enable = true;

  ohMyZsh = {
    enable = true;
    plugins = [ "git" "sudo" "docker" "kubectl" "thefuck" ];
    theme = "robbyrussell";
  };

  shellAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch";
  };
  histSize = 10000;
};

}
