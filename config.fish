function fish_user_key_bindings
  for mode in insert default visual
    fish_default_key_bindings -M $mode
  end
  fish_vi_key_bindings --no-erase
  bind \cr 'peco_select_history (commandline -b)'
end

set -x theme_nerd_fonts yes
set -x TERM xterm-256color
set -x BROWSER open
set -x BROWSER /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome

set -g theme_color_scheme zenburn
set fish_greeting ""
fish_vi_key_bindings

alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias v=nvim
alias vim='nvim'
alias sc='screen'
alias ps='ps --sort=start_time'
alias ps='ps --sort=start_time'

alias mecabi='mecab -d /Users/kengo-ue/local/lib/mecab/dic/mecab-ipadic-neologd -F"%f[6] " -U"%m " -E"\n" -b 819200'
alias mecabwakati='mecab -d /Users/kengo-ue/local/lib/mecab/dic/mecab-ipadic-neologd -Owakati -E"\n" -b 819200'

status --is-interactive; and . (pyenv init -|psub)

function cd
    if test (count $argv) -eq 0
      builtin cd $argv
      return 0
    else if test (count $argv) -gt 1
        printf "%s\n" (_ "Too many args for cd command")
        return 1
    end
    # Avoid set completions.
    set -l previous $PWD

    if test "$argv" = "-"
        if test "$__fish_cd_direction" = "next"
            nextd
        else
            prevd
        end
        return $status
    end
    builtin cd $argv
    set -l cd_status $status
    # Log history
    if test $cd_status -eq 0 -a "$PWD" != "$previous"
        set -q dirprev[$MAX_DIR_HIST]
        and set -e dirprev[1]
        set -g dirprev $dirprev $previous
        set -e dirnext
        set -g __fish_cd_direction prev
    end

    if test $cd_status -ne 0
        return 1
    end
    ls
    return $status
end
