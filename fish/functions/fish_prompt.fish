function fish_prompt --description "Write out Marks' custom prompt"
  if set -q VIRTUAL_ENV
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
  end

  set_color blue
  prompt_pwd | tr -d '\n'
  fish_git_prompt
  set_color green
  echo -s ' ❯ ' $__fish_prompt_normal
end
