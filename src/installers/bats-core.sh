#!/usr/bin/env bash
# https://bats-core.readthedocs.io/en/stable/tutorial.html#quick-installation
set -euxo pipefail
git submodule add https://github.com/bats-core/bats-core.git test/bats
git submodule add https://github.com/bats-core/bats-support.git test/test_helper/bats-support
git submodule add https://github.com/bats-core/bats-assert.git test/test_helper/bats-assert

ln -s /usr/local/bin/bats test/bats/bin/bats
exit 0
# maybe global install is better?r conda
ls -l /usr/local/bin/bats
