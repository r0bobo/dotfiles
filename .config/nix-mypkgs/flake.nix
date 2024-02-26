{
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    packages."x86_64-linux".default =
      let pkgs = nixpkgs.legacyPackages."x86_64-linux";
      in pkgs.buildEnv {
        name = "home-packages";
        paths = with pkgs; [
          bazelisk
          crane
          devbox
          dive
          elixir_ls
          emacs-lsp-booster
          exercism
          go-2fa
          godef
          gofumpt
          golangci-lint
          gomodifytags
          gopls
          gotools
          grex
          hey
          istioctl
          javascript-typescript-langserver
          k9s
          kail
          kind
          krew
          kubernetes-helm
          minikube
          nix-zsh-completions
          nodePackages.prettier
          nodePackages.stylelint
          rbw
          rustup
          solargraph
          starship
          tf-summarize
          tfautomv
          tflint
          tflint-plugins.tflint-ruleset-google
          tfswitch
          tgswitch
          tmuxPlugins.extrakto
          typescript
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
