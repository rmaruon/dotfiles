" DISPLAY
set number           " 行番号表示
set showmode         " モード表示
set title            " 編集中のファイル名を表示
set ruler            " ルーラーの表示
set showcmd          " 入力中のコマンドをステータスに表示する
set showmatch        " 括弧入力時の対応する括弧を表示
set matchtime=3      " 対応括弧のハイライト表示を3秒
set laststatus=2     " ステータスラインを常に表示
set colorcolumn=80   " 80行目にラインを表示
set cursorline       " カーソル行をハイライト
set list             " 不可視文字の可視化
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set t_vb=            " 前時代的スクリーンベルを無効化
set novisualbell
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

" PROGRAMMING_HELP
syntax on        " カラー表示
set smartindent  " オートインデント

" tab関連
set expandtab        " タブの代わりに空白文字挿入
set ts=2 sw=2 sts=0  " タブは半角2文字分のスペース

" ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" SEARCH
set ignorecase  "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase   "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan    "検索時に最後まで行ったら最初に戻る
"set noincsearch "検索文字列入力時に順次対象文字列にヒットさせない
set incsearch   "インクリメンタルサーチ
set hlsearch    "検索結果のハイライト表示

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" OPERATION
set mouse=a
noremap ; :
noremap : ;
inoremap <silent> jj <ESC> "jjでesc代わり
inoremap <silent> kk <ESC> "kkでesc代わり
" TABにて対応ペアにジャンプ?
nnoremap <Tab> %
vnoremap <Tab> %
" カーソルを表示行で移動する。物理行移動は<C-n>,<C-p>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
"カーソルキーで行末／行頭の移動可能に設定。
set whichwrap=b,s,[,],<,>
nnoremap h <Left>
nnoremap l <Right>
"Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Insertモード中にバックスペースを使う
set backspace=indent,eol,start
" insertモードから抜ける
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> j
inoremap <silent> kk <ESC>
inoremap <silent> <C-k> k
" 行頭・行末移動方向をキーの相対位置にあわせる
nnoremap 0 $
nnoremap 1 0

vnoremap v $h " vを二回で行末まで選択

" PASTE
autocmd InsertChange * set paste
autocmd InsertLeave * set nopaste
noremap <C-p> :r !pbpaste
" クリップボードをデフォルトのレジスタとして指定。後にYankRingを使うので
" 'unnamedplus'が存在しているかどうかで設定を分ける必要がある
if has('unnamedplus')
  " set clipboard& clipboard+=unnamedplus " 2013-07-03 14:30 unnamed 追加
  set clipboard& clipboard+=unnamedplus,unnamed
else
  " set clipboard& clipboard+=unnamed,autoselect 2013-06-24 10:00 autoselect 削除
  set clipboard& clipboard+=unnamed
endif

" 前時代的なものを無効化
set nowritebackup
set nobackup
set noswapfile

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge

" 全角スペースの表示
" http://inari.hatenablog.com/entry/2014/05/05/231307
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpacE
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif
