{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [

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

        # Zsh stuf
        antibody
        nix-zsh-completions
        zsh-autosuggestions
        zsh-completions
        zsh-fast-syntax-highlighting
        zsh-syntax-highlighting

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
