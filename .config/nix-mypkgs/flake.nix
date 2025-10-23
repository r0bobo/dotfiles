{
  inputs = { nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; };

  outputs = { self, nixpkgs }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    packages."x86_64-linux".default =
      let pkgs = nixpkgs.legacyPackages."x86_64-linux";
      in pkgs.buildEnv {
        name = "home-packages";
        paths = with pkgs; [
          actionlint
          argocd
          asciinema
          asciinema-agg
          atuin
          bash-language-server
          bazel-watcher
          bazelisk
          bfg-repo-cleaner
          btdu
          buf
          buildifier
          buildozer
          cosign
          crane
          cue
          dbmate
          devbox
          diffoci
          difftastic
          dive
          dyff
          elixir_ls
          emacs-lsp-booster
          exercism
          ghc
          go
          go-2fa
          go-jsonnet
          godef
          gofumpt
          golangci-lint
          gomodifytags
          gopls
          gotools
          graphql-language-service-cli
          grex
          haskell-language-server
          hclfmt
          helmfile
          hey
          hledger
          istioctl
          jd-diff-patch
          jsonnet-language-server
          jujutsu
          k9s
          kind
          krew
          kubecolor
          kubernetes-helm
          kustomize
          minikube
          mkcert
          nix-zsh-completions
          nodePackages.prettier
          nodePackages.stylelint
          nodePackages.typescript-language-server
          plantuml
          protobuf
          protoc-gen-go
          protoc-gen-go-grpc
          python313Packages.black
          python313Packages.grip
          python313Packages.mypy
          python313Packages.python-lsp-black
          python313Packages.python-lsp-ruff
          python313Packages.python-lsp-server
          rbw
          resticprofile
          ruff
          rustup
          shfmt
          solargraph
          starpls-bin
          starship
          stern
          tenv
          terraform-ls
          tf-summarize
          tfautomv
          tflint
          tmuxPlugins.extrakto
          tmuxPlugins.tmux-thumbs
          typescript
          vhs
          viddy
          vscode-langservers-extracted
          watchexec
          yadm
          yaml-language-server
          yq-go
        ];
        pathsToLink = [ "/bin" "/share" ];
        extraOutputsToInstall = [ "man" "doc" ];
      };
  };

}
