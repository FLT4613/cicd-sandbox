#!/bin/sh

set -eu

pushd ./sandbox-vm
vagrant up
vagrant package
vagrant box add sandbox-vm package.box
rm package.box
vagrant destroy -f
popd
vagrant up
