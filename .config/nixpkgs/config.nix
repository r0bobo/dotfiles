{
  packageOverrides = pkgs:
    with pkgs; {
      myPackages = pkgs.buildEnv {
        name = "my-packages";
        paths = [
          dive
          elixir_ls
          emacs-lsp-booster
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
          nix-zsh-completions
          nixfmt
          rbw
          rustup
          solargraph
          starship
          yaml-language-server
          yq-go
        ];
        pathsToLink = [ "/bin" "/share" ];
        extraOutputsToInstall = [ "man" "doc" ];
      };
    };
}
