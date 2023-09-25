#!/usr/bin/env bash
set -euo pipefail

go install github.com/fatih/gomodifytags@v1.16.0
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.53.1
go install golang.org/x/tools/cmd/godoc@v0.9.3
go install golang.org/x/tools/cmd/goimports@v0.9.3
go install golang.org/x/tools/cmd/gorename@v0.9.3
go install golang.org/x/tools/cmd/guru@v0.9.3
go install golang.org/x/tools/gopls@v0.12.2
go install github.com/rogpeppe/godef@v1.1.2

go install github.com/google/go-containerregistry/cmd/crane@v0.15.2

go install rsc.io/2fa@v1.2.0
