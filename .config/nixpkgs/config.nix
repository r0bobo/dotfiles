{
  packageOverrides = pkgs:
    with pkgs; {
      myPackages = pkgs.buildEnv {
        name = "my-packages";
        paths = [
          dive
          elixir_ls
          exercism
          grex
          hey
          istioctl
          k9s
          kail
          kind
          krew
          kubernetes-helm
          minikube
          nixfmt
          rbw
          rustup
          solargraph
          starship
          yaml-language-server
          yq-go

          # Zsh stuf
          nix-zsh-completions
        ];
        pathsToLink = [ "/bin" "/share" ];
        extraOutputsToInstall = [ "man" "doc" ];
      };
    };
}
