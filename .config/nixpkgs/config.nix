{
  packageOverrides = pkgs:
    with pkgs; {
      myPackages = pkgs.buildEnv {
        name = "my-packages";
        paths = [
          dive
          elixir_ls
          exercism
          gitAndTools.git-sync
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
          tmuxPlugins.extrakto
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
