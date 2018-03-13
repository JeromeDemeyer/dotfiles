" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set autowrite           " Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
"set mouse=a            " Enable mouse usage (all modes)

" $Id$
set encoding=utf8
set ffs=unix,dos,mac

" Option d'affichage
set novb       "visual bell - disable avec 'set novb'
set noeb       "no error bell
set number     "affiche le numero de ligne
set wrap       "(de)sactive le retour a la ligne
set showmode   "pour savoir si on est en mode edition ou pas
set ruler      "pour connaitre les coordonnees du curseur
set hlsearch   "highlight searches


" option d'edition
set undolevels=500
set autoindent
set smartindent
set smarttab
set tabstop=8        " real TAB visual length
set expandtab        " convertir les TAB en SPACES
set shiftwidth=3
set softtabstop=3
"autocmd FileType awk set tabstop=3|set shiftwidth=3|set expandtab
"autocmd FileType sh set tabstop=3|set shiftwidth=3|set expandtab


" on reset toutes les couleurs !
hi clear
set background=dark
if exists("syntax_on")
   syntax reset
endif

" 16 couleurs en mode terminal
set t_Co=16
" coloration syntaxique
syntax on
hi Normal         ctermfg=LightGrey
hi Comment        ctermfg=LightBlue
hi Ignore         ctermfg=Grey
hi Constant       ctermfg=Grey
hi Todo           ctermfg=DarkRed  ctermbg=Yellow
hi Special        ctermfg=LightRed
"hi Identifier     ctermfg=LightGreen
hi Statement      ctermfg=LightGreen
hi Function       ctermfg=DarkGreen
hi PreProc        ctermfg=DarkGreen
hi Type           ctermfg=DarkGreen
hi SpecialKey     ctermfg=LightRed
" Others
hi Question       ctermfg=White  ctermbg=Blue
hi MoreMsg        ctermfg=White  ctermbg=Blue
hi ModeMsg        ctermfg=White  ctermbg=Blue
hi Error          ctermfg=White  ctermbg=DarkRed
hi ErrorMsg       ctermfg=White  ctermbg=DarkRed
hi WarningMsg     ctermfg=Red    ctermbg=Black
hi IncSearch      cterm=underline ctermfg=White ctermbg=None
hi Search         cterm=underline ctermfg=White ctermbg=None
hi LineNr         ctermfg=DarkGrey
hi NonText        ctermfg=DarkGrey
hi StatusLine     ctermfg=LightGrey ctermbg=DarkGrey
hi Visual         cterm=reverse

if &term =~ "256color"
   hi Normal         ctermfg=251
   hi Constant       ctermfg=145
   hi Comment        ctermfg=62
   hi LineNr         ctermfg=8 ctermbg=233
endif

"JeromeDemeyer2017
