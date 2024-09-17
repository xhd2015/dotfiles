# for PS1
# You can define these variables to simplify your shell:
#   export X=~/Users/xhd2015/Projects/xhd2015
#   export GOPATH=~/Users/xhd2015/gopath
#   export W=$GOPATH/src/git.your-campany.com
#   export W0=$W/your/main/project

# NOTE: not using git branch --show-current
# because when we are not on a branch, it outputs nothing
# while git branch will give us something like:
#   * (HEAD detached at 59376540a)
parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function show_shortpath {
    p=${1/#'/Users/xhd2015'/'~'}
    p=${p/#'~/Projects/xhd2015'/'$X'}
    # because we have gopath, gopath1.13,...., so we must distinguish between them.
    p=${p/#'~/Projects/gopath/'/'$GOPATH/'}
    p=${p/%'~/Projects/gopath'/'$GOPATH'}
    p=${p/#'$GOPATH/src/git.your-campany.com'/'$W'}
    p=${p/#'$W/your/main/project'/'$W0'}

    # remote
    p=${p/#'~/Remote'/'$REMOTE_ROOT'}
    p=${p/#'$REMOTE_ROOT/Projects/gopath'/'$REMOTE_GOPATH'}
    p=${p/#'$REMOTE_GOPATH/src/git.your-company.com/your/main/project'/'$W1'}

    echo -n "$p"
}
function shortpath {
    show_shortpath "$PWD"
}

function get_ip {
    ifconfig en0 | grep 'inet ' | awk '{print $2}'
}

U_APPLE=$(echo -ne '\xef\xa3\xbf')
U_STRAWBERRY=$(echo -ne '\xf0\x9f\x8d\x93')
U_PENGUIN=$(echo -ne '\xf0\x9f\x90\xa7')
# \u@$(get_ip) ...
PS1='\u \[\e[33m\]$(shortpath)\[\033[32m\]$(parse_git_branch)\[\033[00m\] \t \n$U_APPLE '