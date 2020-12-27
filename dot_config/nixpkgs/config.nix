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
          gmailctl
          go-jsonnet
          hey
          k9s
          kail
          kind
          kpt
          kubernetes-helm
          kustomize
          nixfmt
          operator-sdk
          skaffold
          starship
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
