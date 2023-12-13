#!/usr/bin/env bash
set -euo pipefail

goinstall() {
    echo Installing go package $* >&2
    go install $*
}

goinstall github.com/bazelbuild/bazelisk@v1.19.0
goinstall github.com/fatih/gomodifytags@v1.16.0
goinstall github.com/golangci/golangci-lint/cmd/golangci-lint@v1.55.2
goinstall github.com/google/go-containerregistry/cmd/crane@v0.17.0
goinstall github.com/rogpeppe/godef@v1.1.2
goinstall golang.org/x/tools/cmd/godoc@v0.16.1
goinstall golang.org/x/tools/cmd/goimports@v0.16.0
goinstall golang.org/x/tools/cmd/gorename@v0.16.0
goinstall golang.org/x/tools/cmd/guru@v0.16.1
goinstall golang.org/x/tools/gopls@v0.14.2
goinstall rsc.io/2fa@v1.2.0
