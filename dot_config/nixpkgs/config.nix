{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [

        argocd
        cfssl
        chezmoi
        dive
        dogdns
        hey
        go-jsonnet
        k9s
        kail
        kind
        kpt
        kubernetes-helm
        kustomize
        operator-sdk
        skaffold
        starship
        wrk
        yq-go

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
