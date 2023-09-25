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
          terraform
          tmuxPlugins.extrakto
          wrk
          yadm
          yaml-language-server
          yq-go

          # Zsh stuf
          nix-zsh-completions
          zsh-completions
        ];
        pathsToLink = [ "/bin" "/share" ];
        extraOutputsToInstall = [ "man" "doc" ];
      };
    };
}
