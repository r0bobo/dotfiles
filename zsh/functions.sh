#!/bin/sh

rmd () {
  pandoc $1 | lynx -stdin
}
