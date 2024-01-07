# fzf-alias

Run a command or a file by selecting with fzf gui.

Usage:
```
bash /path/to/fzf-alias/fzf_alias_commands.sh
```

Set commands:
```
In settings.sh, set alias and command like this
["alias"]="command"
```

Optional:
in .bashrc
```
alias fzf='bash /path/to/fzf-alias/fzf_alias_commands.sh'
alias fzf-edit='code /path/to/fzf-alias/settings.sh'
```
