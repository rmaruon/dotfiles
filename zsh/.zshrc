export LANG=ja_JP.UTF-8
export EDITOR=vim
bindkey -e


#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Load .*z files
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if [ -f ~/.zprivate ]; then
  source ~/.zprivate
fi

if [ -f ~/.zaliases ]; then
  source ~/.zaliases
fi

case ${OSTYPE} in
  darwin*) source ~/.zshrc.osx ;;
  linux*) source ~/.zshrc.linux ;;
esac


#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Prompt
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# ${fg[...]} や $reset_color をロード
autoload -U colors; colors

PROMPT="
%F{3}$%f "
PROMPT2="> "
SPROMPT="%r is correct? [n,y,a,e]: "
RPROMPT='[`rprompt-git-current-branch`%F{cyan}%~%f]'
RPROMPT2="%K{green}%_%k"

setopt prompt_subst  # プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt transient_rprompt  # 入力が右端まで来たらRPROMPTを消す

function rprompt-git-current-branch {
  local name st color

  if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
    return
  fi
  name=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
  if [[ -z $name ]]; then
    return
  fi
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    color=${fg[green]}
  elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
    color=${fg[yellow]}
  elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
    color=${fg_bold[red]}
  else
    color=${fg[red]}
  fi

  echo "%{$color%}$name%{$reset_color%} "
}


#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# History
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt extended_history    # zsh の開始, 終了時刻をヒストリファイルに書き込む
setopt hist_ignore_dups    # 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_space   # コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_no_store       # history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_reduce_blanks  # 余分なスペースを削除してヒストリに保存する
setopt hist_verify         # ヒストリを呼び出してから実行する間に一旦編集
setopt inc_append_history  # すぐにヒストリファイルに追記する。
setopt share_history       # ヒストリを共有


#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Complement
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

autoload -Uz compinit
compinit

# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'

setopt auto_list          # 補完候補を一覧表示
setopt auto_menu          # TAB で順に補完候補を切り替える, 補完候補が複数あるときに自動的に一覧表示する
setopt auto_param_keys    # カッコの対応などを自動的に補完
setopt auto_param_slash   # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt brace_ccl          # {a-c} を a b c に展開する機能を使えるようにする
setopt correct            # スペルチェック
setopt equals             # =command を command のパス名に展開する
# setopt extended_glob     # ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt list_packed        # 補完候補を詰めて表示
setopt list_types         # 補完候補一覧でファイルの種別をマーク表示
setopt magic_equal_subst  # --prefix=/usr などの = 以降も補完
setopt mark_dirs          # ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt noautoremoveslash  # 最後のスラッシュを自動的に文字削除しない
setopt numeric_glob_sort  # ファイル名の展開で辞書順ではなく数値的にソート

zstyle ':completion:*:default' menu select=1         # 補完候補のカーソル選択を有効に
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'  # 大文字小文字を区別しない

# 補完候補の色づけ
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Uncategorize
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

limit coredumpsize 102400  # コアダンプサイズを制限
unsetopt promptcr          # 出力の文字列末尾に改行コードが無い場合でも表示

setopt auto_pushd          # cd -[tab]でcdのhistoryを閲覧できる
setopt auto_resume         # サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム
setopt interactive_comments  # コマンドラインでも # 以降をコメントと見なす
setopt long_list_jobs      # 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt nobeep              # ビープを鳴らさない
setopt print_eight_bit     # 出力時8ビットを通す 日本語ファイル名を表示可能に
setopt pushd_ignore_dups   # 同じディレクトリを pushd しない

# ディレクトリ名だけで cdしてls
setopt auto_cd
function chpwd() { ls }
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
