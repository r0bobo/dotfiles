{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        antibody
        chezmoi
        dive
        dogdns
        helm
        hey
        k9s
        kind
        kpt
        kustomize
        starship
        wrk
      ];
      pathsToLink = [
        "/bin"
        "/share"
      ];
      extraOutputsToInstall = [
        "man"
        "doc"
      ];
    };
  };
}
