function fish_prompt
    set -l last_status $status

    # pwd
    set_color --bold
    echo -n (prompt_pwd)
    set_color normal

    # git
    echo -n (fish_git_prompt ' %s')

    # cmd duration (if > 1s, matching hydro's default threshold)
    if test $CMD_DURATION -gt 1000
        set -l secs (math --scale=1 $CMD_DURATION/1000 % 60)
        set -l mins (math --scale=0 $CMD_DURATION/60000 % 60)
        set -l hours (math --scale=0 $CMD_DURATION/3600000)
        set -l parts
        test $hours -gt 0 && set -a parts $hours"h"
        test $mins -gt 0 && set -a parts $mins"m"
        test $secs -gt 0 && set -a parts $secs"s"
        set_color brblack
        echo -n " "(string join '' $parts)
        set_color normal
    end

    # prompt symbol, with exit code if last command failed
    if test $last_status -ne 0
        set_color red
        echo -n " | $last_status"
        set_color normal
    end
    echo -n " ❱ "
end
