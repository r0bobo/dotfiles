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
          dive
          dogdns
          exercism
          gitAndTools.git-sync
          gmailctl
          go-jsonnet
          hey
          k9s
          kail
          kind
          kpt
          kubernetes-helm
          kubeseal
          kustomize
          nix-tree
          nixfmt
          operator-sdk
          rustc
          rust-analyzer
          skaffold
          starship
          terraform-provider-libvirt
          terraform_0_14
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
