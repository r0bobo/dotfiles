{
  packageOverrides = pkgs:
    with pkgs; {
      myPackages = pkgs.buildEnv {
        name = "my-packages";
        paths = [

          bitwarden-cli
          cachix
          chezmoi
          dive
          dogdns
          gitAndTools.git-sync
          gmailctl
          go-jsonnet
          hey
          k9s
          kail
          kind
          kpt
          kubernetes-helm
          kustomize
          nix-tree
          nixfmt
          operator-sdk
          skaffold
          starship
          terraform_0_14
          terraform-provider-libvirt
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
