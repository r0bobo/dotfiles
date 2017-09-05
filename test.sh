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
    result=$(ls -1 testdir/.ctags* | wc -l)
    [ "$result" -eq 2 ]
}

@test "Setup vimplug" {
    INSTALL_DIR=testdir make vimplug
    [ -f testdir/.local/share/nvim/site/autoload/plug.vim ]
}

@test "Setup zplug" {
    INSTALL_DIR=testdir make zplug
    run zsh -c "source testdir/.zplug/init.zsh"
    [ "$status" -eq 0 ]
}

@test "Setup virtual environment" {
    VENV=testdir/.local/share/nvim/.virtualenv
    INSTALL_DIR=testdir make virtual_env
    run source $VENV/bin/activate
    [ "$status" -eq 0 ]
}
