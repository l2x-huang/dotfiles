"---------------------------------------------------------------------------
" Base:
"

" Build encodings.
let &fileencodings = 'ucs-bom,utf-8,iso-2022-jp-3,euc-jp,cp932'

if has('multi_byte_ime')
  set iminsert=0 imsearch=0
endif

set packpath=


"---------------------------------------------------------------------------
" Search:
"

" Ignore the case of normal letters.
set ignorecase
" If the search pattern contains upper case characters, override ignorecase
" option.
set smartcase

" Enable incremental search.
set incsearch
" Don't highlight search result.
set hlsearch

" Searches wrap around the end of the file.
set wrapscan


"---------------------------------------------------------------------------
" Edit:
"

" Smart insert tab setting.
set smarttab
" Exchange tab to spaces.
set expandtab
" Substitute <Tab> with blanks.
" set tabstop=8
" Spaces instead <Tab>.
" Autoindent width.
set tabstop=4
set softtabstop=2
set shiftwidth=2
" Round indent by shiftwidth.
set shiftround

" Enable smart indent.
set autoindent smartindent

" Disable modeline.
set modelines=0
set nomodeline
" For only Vim help files.
autocmd MyAutoCmd BufRead,BufWritePost *.txt setlocal modelines=2 modeline

" Enable backspace delete indent and newline.
set backspace=indent,eol,nostop

" Highlight <>.
set matchpairs+=<:>

" Display another buffer when current buffer isn't saved.
set hidden

" Disable folding.
set foldenable
set foldmethod=indent
set foldlevel=3
" Show folding level.
set foldcolumn=0
set fillchars=vert:\|
set commentstring=%s

" Use vimgrep.
" set grepprg=internal
" Use grep.
set grepprg=grep\ -inH

set isfname-==
set isfname+=@-@

" Keymapping timeout.
set timeout timeoutlen=3000 ttimeoutlen=100

" CursorHold time.
set updatetime=100

" Set swap directory.
set directory-=.

" Set undofile.
set undofile
let &g:undodir = &directory

" Enable virtualedit in visual block mode.
set virtualedit=block

" Set keyword help.
set keywordprg=:help

" Disable paste.
autocmd MyAutoCmd InsertLeave *
      \ if &paste | setlocal nopaste | echo 'nopaste' | endif |
      \ if &l:diff | diffupdate | endif

" Update diff.
autocmd MyAutoCmd InsertLeave * if &l:diff | diffupdate | endif

set diffopt=internal,algorithm:patience,indent-heuristic

" Make directory automatically.
" --------------------------------------
" http://vim-users.jp/2011/02/hack202/
autocmd MyAutoCmd BufWritePre *
      \ call s:mkdir_as_necessary(expand('<afile>:p:h'), v:cmdbang)
function! s:mkdir_as_necessary(dir, force) abort
  if !isdirectory(a:dir) && &l:buftype ==# '' &&
        \ (a:force || input(printf('"%s" does not exist. Create? [y/N]',
        \              a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

" Use blowfish2
" Note: It seems 15ms overhead.
" https://dgl.cx/2014/10/vim-blowfish
" if has('cryptv')
  "  set cryptmethod=blowfish2
" endif

" If true Vim master, use English help file.
set helplang& helplang=en,ja

" Default fileformat.
set fileformat=unix
" Automatic recognition of a new line cord.
set fileformats=unix,dos,mac

"---------------------------------------------------------------------------
" View:
"

" Disable menu.vim
if vimrc#is_gui_running()
  set guioptions=Mc
endif

" Show <TAB> and <CR>
set list
if has('win32')
   set listchars=tab:>-,trail:-,precedes:<
else
   set listchars=tab:???\ ,trail:-,precedes:??,nbsp:%
endif

" Always disable statusline.
set laststatus=2
" Height of the command line.
try
  set cmdheight=0
catch
  set cmdheight=1
endtry
" Not show command on statusline.
" set noshowcmd
" Disable ruler
" set noruler

" Show title.
set title
" Title length.
set titlelen=95
" Title string.
let &g:titlestring =
      \ "%{expand('%:p:~:.')} %<\(%{fnamemodify(getcwd(), ':~')}\)%(%m%r%w%)"
" Disable tabline.
set showtabline=0

" Set statusline.
let &g:statusline="%{winnr('$')>1?'['.winnr().'/'.winnr('$')"
      \ . ".(winnr('#')==winnr()?'#':'').']':''}\ "
      \ . "%{(&previewwindow?'[preview] ':'').expand('%:t')}"
      \ . "\ %=%{(winnr('$')==1 || winnr('#')!=winnr()) ?
      \ '['.(&filetype!=''?&filetype.',':'')"
      \ . ".(&fenc!=''?&fenc:&enc).','.&ff.']' : ''}"
      \ . "%m%{printf('%'.(len(line('$'))+2).'d/%d',line('.'),line('$'))}"

" Note: wrap option is very slow!
set nowrap
" Turn down a long line appointed in 'breakat'
set linebreak
set showbreak=\
set breakat=\ \	;:,!?
" Wrap conditions.
set whichwrap+=h,l,<,>,[,],b,s,~
set breakindent

" Short messages
set shortmess=aTIcFoOsSW
set noshowmode

" Don't create backup.
set nowritebackup
set nobackup
set noswapfile
set backupdir-=.

" Disable bell.
set t_vb=
set novisualbell
set belloff=all

" Display candidates by popup menu.
set wildmenu
set wildmode=full
set wildoptions+=pum
if has('patch-8.2.4463')
  set wildoptions+=fuzzy
endif

" Display candidates by list.
"set nowildmenu
"set wildmode=list:longest,full

" Display all the information of the tag by the supplement of the Insert mode.
set showfulltag
" Can supplement a tag in a command-line.
set wildoptions+=tagfile
" Complete all candidates
set wildignorecase

" Increase history amount.
set history=200
if has('nvim')
  set shada='100,<20,s10,h
else
  set viminfo='100,<20,s10,h
endif

" Disable menu
let g:did_install_default_menus = v:true

" Completion setting.
set completeopt=menuone
if exists('+completepopup')
  set completeopt+=popup
  set completepopup=height:4,width:60,highlight:InfoPopup
endif
" Don't complete from other buffer.
set complete=.
" Set popup menu max height.
set pumheight=10
if exists('+pumwidth')
  " Set popup menu min width.
  set pumwidth=0
endif
" Use "/" for path completion
set completeslash=slash

" Report changes.
set report=0

" Maintain a current line at the time of movement as much as possible.
set nostartofline

" Splitting a window will put the new window below the current one.
set splitbelow
" Splitting a window will put the new window right the current one.
set splitright
" Set minimal width for current window.
set winwidth=30
" Set minimal height for current window.
" set winheight=20
set winheight=1
" Set maximam maximam command line window.
set cmdwinheight=5
" No equal window size.
set noequalalways

" Adjust window size of preview and help.
set previewheight=8
set helpheight=12

set ttyfast

" When a line is long, do not omit it in @.
set display=lastline
" Display an invisible letter with hex format.
set display+=uhex

" For conceal.
set conceallevel=2

set colorcolumn=79

if exists('+previewpopup')
  set previewpopup=height:10,width:60
endif

" Disable signcolumn
set signcolumn=no

" Disable cmdwin
set cedit=
"set cedit=<C-q>

set redrawtime=0

" Enable true color
if exists('+termguicolors')
  set termguicolors
endif

" set cursorline
set scrolloff=5
" Colorscheme
" colorscheme candy
