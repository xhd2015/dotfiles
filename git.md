# Override user email for specific dir

`~/.gitconfig`:
```
# https://www.qloudx.com/how-to-set-up-manage-multiple-git-profiles-like-a-pro/
[includeIf "gitdir:/Users/xhd2015/Projects/xhd2015/"]
  path = /Users/xhd2015/Projects/xhd2015/.gitconfig
```

`~/Projects/xhd2015/.gitconfig`:
```
[user]
    email = xhd2015@gmail.com
    name = xhd2015
```