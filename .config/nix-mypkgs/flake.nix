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
          # python311Packages.black
          # python311Packages.python-lsp-black
          actionlint
          ansible-language-server
          argocd
          asciinema
          asciinema-agg
          bazelisk
          bfg-repo-cleaner
          buf
          cosign
          crane
          cue
          dbmate
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
          kustomize
          minikube
          mkcert
          nix-zsh-completions
          nodePackages.prettier
          nodePackages.stylelint
          nodePackages.typescript-language-server
          protobuf
          protoc-gen-go
          protoc-gen-go-grpc
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
          vendir
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
