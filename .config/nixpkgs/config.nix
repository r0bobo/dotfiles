{
  packageOverrides = pkgs:
    with pkgs; {
      myPackages = pkgs.buildEnv {
        name = "my-packages";
        paths = [
          awscli2
          cachix
          dbmate
          clippy
          dive
          elixir_ls
          exercism
          gitAndTools.git-sync
          gmailctl
          grex
          hey
          k9s
          kail
          kind
          kpt
          krew
          kubectl
          kubernetes-helm
          kustomize
          minikube
          nix-tree
          nixfmt
          ripgrep-all
          rust-analyzer
          rustup
          solargraph
          starship
          terraform
          tmuxPlugins.extrakto
          wrk
          yadm
          yaml-language-server
          yq-go

          # Golang
          golangci-lint
          gomodifytags

          # Zsh stuf
          nix-zsh-completions
          zsh-autosuggestions
          zsh-completions
          zsh-syntax-highlighting

        ];
        pathsToLink = [ "/bin" "/share" ];
        extraOutputsToInstall = [ "man" "doc" ];
      };
    };
}
