{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [

        chezmoi
        dive
        dogdns
        hey
        k9s
        kail
        kind
        kpt
        kubernetes-helm
        kustomize
        operator-sdk
        starship
        wrk

        # Zsh stuf
        antibody
        nix-zsh-completions
        zsh-autosuggestions
        zsh-completions
        zsh-fast-syntax-highlighting

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
