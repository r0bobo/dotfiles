{
  packageOverrides = pkgs:
    with pkgs; {
      myPackages = pkgs.buildEnv {
        name = "my-packages";
        paths = [

          awscli2
          bitwarden-cli
          cachix
          cargo
          chezmoi
          clippy
          cue
          dive
          dogdns
          exercism
          gitAndTools.git-sync
          gmailctl
          go-jsonnet
          grex
          hey
          k9s
          kail
          kind
          kpt
          krew
          kubectl
          kubernetes-helm
          kubeseal
          kustomize
          minikube
          nix-tree
          nixfmt
          ripgrep-all
          rust-analyzer
          rustc
          rustfmt
          skaffold
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
          zsh-fast-syntax-highlighting

        ];
        pathsToLink = [ "/bin" "/share" ];
        extraOutputsToInstall = [ "man" "doc" ];
      };
    };
}
