{
  packageOverrides = pkgs:
    with pkgs; {
      myPackages = pkgs.buildEnv {
        name = "my-packages";
        paths = [
          awscli2
          cachix
          dbmate
          dive
          elixir_ls
          exercism
          fd
          gitAndTools.git-sync
          gmailctl
          grex
          hey
          hyperfine
          k9s
          kail
          kind
          krew
          kubernetes-helm
          minikube
          nix-tree
          nixfmt
          ripgrep-all
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
