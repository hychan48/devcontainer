#!/usr/bin/env bats
# installer/main.bats
# should test if main.bash was ran properly. install should work naturally
setup() {
    load '../test_helper/bats-support/load'
    load '../test_helper/bats-assert/load'
    # ... the remaining setup is unchanged

    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    # PATH=`echo "$DIR/../src:$PATH"`
    # echo $DIR 
    # devcontainer/test/installers, 
    # ls /root/projects/devcontainer/test/installers
    # echo $DIR/../../src/setup/profile-config.bash
    # src/setup/profile-config.bash
    # ls -l "$DIR/../../src/setup/profile-config.bash"
    source "$DIR/../../src/setup/profile-config.bash"
    # load /root/projects/devcontainer/src/setup/profile-config.bash
    # source /root/projects/devcontainer/src/setup/profile-config.bash
    # load $DIR/../../src/setup/profile-config.bash1
    # printenv PROJECT_ROOT
}
teardown() {
    # rm -f /tmp/bats-tutorial-project-ran
    echo "teardown"
}

tmp_scratch(){
  run main
  assert_output "tmps" # does nothing
  
}
@test "install_omz_jc" {
  run install_omz_jc
  assert_success
  # assert_output "tmps" # does nothing
  # assert_output "tmps" # does nothing




}

# timezone should be dynamic... but later