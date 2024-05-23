{
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    packages."x86_64-linux".default =
      let pkgs = nixpkgs.legacyPackages."x86_64-linux";
      in pkgs.buildEnv {
        name = "home-packages";
        paths = with pkgs; [
          # python311Packages.black
          # python311Packages.python-lsp-black
          ansible-language-server
          actionlint
          asciinema
          asciinema-agg
          bazelisk
          crane
          devbox
          difftastic
          dive
          dyff
          elixir_ls
          emacs-lsp-booster
          exercism
          go
          go-2fa
          godef
          gofumpt
          golangci-lint
          gomodifytags
          gopls
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
          python311Packages.python-lsp-ruff
          python311Packages.python-lsp-server
          rbw
          rustup
          solargraph
          starship
          tenv
          terraform-ls
          tf-summarize
          tfautomv
          tflint
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
