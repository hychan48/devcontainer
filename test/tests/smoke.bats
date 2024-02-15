#!/usr/bin/env bats
setup() {
    load '../test_helper/bats-support/load'
    load '../test_helper/bats-assert/load'
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # source "$DIR/../../src/setup/profile-config.bash"
}
teardown() {
    # rm -f /tmp/bats-tutorial-project-ran
    echo "teardown"
}
main(){
  echo hi
}

tmp_scratch(){
  run main
  assert_output "tmps" # does nothing
  
}
@test "install_omz_jc" {
  # run install_omz_jc
  run main
  assert_success
  # assert_output "tmps" # does nothing
  # assert_output "tmps" # does nothing


}

# timezone should be dynamic... but later