#!/bin/bash
tmpdir=$1
shopt -s dotglob
cp -r ../app/* $tmpdir/
shopt -u dotglob
