#
exit 0

function build_string() {
    local -a parts=("$@")
    local IFS='' # Set IFS to empty to avoid spaces when joining
    echo "${parts[*]}"
}

# Usage
my_string=$(build_string "Hello, " "World" "!")
echo "$my_string"


# pwsh:
function Build-String {
    $result = ""

    foreach ($arg in $args) {
        $result += $arg
    }

    # Write the string to the output.
    Write-Output $result
}

# Usage
$myString = Build-String "Hello, " "World" "!"
Write-Output $myString

exit 0
# alias cockpit-start-alias='tmux new-session -d -s cockpit-wsinstance \'runuser -u cockpit-wsinstance -- /usr/lib/cockpit/cockpit-ws --no-tls --local-session BRIDGE\''
rm -rf /etc/cockpit/disallowed-users # empty on ubuntu
alias cockpit-start-alias="tmux new-session -d -s cockpit-wsinstance 'runuser -u cockpit-wsinstance -- /usr/lib/cockpit/cockpit-ws --no-tls --local-session BRIDGE'"

# optimize later... check line by line function kinda thing / smart merge