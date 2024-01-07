# Set alias and command like this
# ["alias"]="command"

DIR="${FZF_ALIAS_DIR}"

declare -A commands
commands=(
  ["git show upstream"]="git branch -vv"
  ["git show remote branch"]="git remote -v"
  ["git show toplevel"]="git rev-parse --show-toplevel"
  ["git safe push"]="bash ${DIR}/git_safe_push.sh"
  ["git checkout"]="bash ${DIR}/git_branch_checkout.sh"
  ["git stash specific files"]="bash ${DIR}/git_stash_specific_files.sh"
  ["ChatGPT print out files"]="bash ${DIR}/print_out_selected_files.sh > ${DIR}/tmp_print_out_selected_files.txt && code ${DIR}/tmp_print_out_selected_files.txt"
)
