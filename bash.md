# PS1 with 

`~/.bash_profile`:

```sh
# PS1
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
    
    # remote
    p=${p/#'~/Remote'/'$REMOTE_ROOT'}
    p=${p/#'$REMOTE_ROOT/Projects/gopath'/'$REMOTE_GOPATH'}
    
    echo -n "$p"
}

function shortpath {
    show_shortpath "$PWD"
}

U_APPLE=$(echo -ne '\xef\xa3\xbf')
U_STRAWBERRY=$(echo -ne '\xf0\x9f\x8d\x93')
U_PENGUIN=$(echo -ne '\xf0\x9f\x90\xa7')
# \u@$(get_ip) ...
PS1='\u \[\e[33m\]$(shortpath)\[\033[32m\]$(parse_git_branch)\[\033[00m\] \t \n$U_APPLE '
```