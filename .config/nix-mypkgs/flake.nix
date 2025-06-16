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
          ansible-language-server
          argocd
          asciinema
          asciinema-agg
          atuin
          bazel-watcher
          bazelisk
          bfg-repo-cleaner
          buf
          buildifier
          buildozer
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
          gopls
          gotools
          grex
          hclfmt
          helmfile
          hey
          istioctl
          jd-diff-patch
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
          trivy
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
