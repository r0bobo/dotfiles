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
          operator-sdk
          ripgrep-all
          rust-analyzer
          rustc
          rustfmt
          skaffold
          starship
          terraform-provider-libvirt
          terraform
          wrk
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
