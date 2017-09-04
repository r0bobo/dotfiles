#!/usr/bin/env bats

setup() {
    mkdir -p testdir
}

teardown() {
    rm -rf testdir
}

@test "Install all config files" {
    INSTALL_DIR=testdir make
    run diff -r -q configs testdir
    [ "$status" -eq 0 ]
}

@test "Backup existing config" {
    touch testdir/.ctags
    INSTALL_DIR=testdir make
    [ -f testdir/.ctags.~1~ ]
}

@test "Setup virtual environment" {
    VENV=testdir/.local/share/nvim/.virtualenv
    INSTALL_DIR=testdir make virtual_env
    run source $VENV/bin/activate
    [ "$status" -eq 0 ]
}
