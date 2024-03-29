{
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    packages."x86_64-linux".default =
      let pkgs = nixpkgs.legacyPackages."x86_64-linux";
      in pkgs.buildEnv {
        name = "home-packages";
        paths = with pkgs; [
          # gopls
          actionlint
          bazelisk
          crane
          devbox
          dive
          elixir_ls
          emacs-lsp-booster
          exercism
          go
          go-2fa
          godef
          gofumpt
          golangci-lint
          gomodifytags
          gotools
          grex
          helmfile
          hey
          istioctl
          k9s
          kail
          kind
          krew
          kubernetes-helm
          minikube
          mkcert
          nix-zsh-completions
          nodePackages.prettier
          nodePackages.stylelint
          nodePackages.typescript-language-server
          rbw
          rustup
          solargraph
          starship
          tf-summarize
          tfautomv
          tflint
          tfswitch
          tgswitch
          tmuxPlugins.extrakto
          typescript
          vhs
          vscode-langservers-extracted
          yadm
          yaml-language-server
          yq-go
        ];
        pathsToLink = [ "/bin" "/share" ];
        extraOutputsToInstall = [ "man" "doc" ];
      };
  };

}
