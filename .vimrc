".vimrc
"$Id$
"(2013) Jerome Demeyer - intended use: PuTTY > Linux > Screen > vim
set encoding=utf8
set ffs=unix,dos,mac

" Option d'affichage
set noeb       "no error bell
set vb         "visual bell - disable avec 'set novb'
set number     "affiche le numero de ligne
set nowrap     "desactive le retour a la ligne
set showmode   "pour savoir si on est en mode edition ou pas
set ruler      "pour connaitre les coordonnees du curseur

" option d'edition
set undolevels=500
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=3
set shiftwidth=3
set softtabstop=3

" options de recherche
set ignorecase "insensible a la casse
set smartcase  "mais pas tant que ca
set incsearch  "lance la recherche en meme temps que l'on tape

" 16 couleurs en mode terminal
if &term =~ "xterm" | let &t_Co=16 | endif
"if &term =~ "xterm-256color" | let &t_Co=256 | endif

" Si on veut la souris dans VIM sous screen sous putty :
" lancer screen avec l'option -X xterm
" set mouse =a     " maintient le shift-click pour selectionner dans Xterm ou Putty
map <F12> :Texplore<CR>

" on reset toutes les couleurs !
hi clear
:set background=dark
if exists("syntax_on")
   syntax reset
endif
" coloration syntaxique
"TODO
syntax on
hi Normal         ctermfg=LightGrey
hi Comment        ctermfg=LightBlue
hi Ignore         ctermfg=Grey
hi Constant       ctermfg=Grey
hi Todo           ctermfg=DarkRed  ctermbg=Yellow
hi Special        ctermfg=LightRed
hi Todo           ctermfg=DarkRed  ctermbg=Yellow
hi Special        ctermfg=LightRed
hi Identifier     ctermfg=LightGreen
hi Statement      ctermfg=LightGreen
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
hi Search       cterm=underline ctermfg=White ctermbg=None
hi IncSearch    cterm=underline ctermfg=White ctermbg=None
hi LineNr         ctermfg=DarkGrey
hi NonText        ctermfg=DarkGrey
hi StatusLine     ctermfg=LightGrey
hi Visual         cterm=reverse


"NERDTree
map <F12> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif "close NERDTree if last window
:set fillchars+=vert:\│
hi VertSplit ctermbg=LightBlue ctermfg=Black  cterm=reverse
hi Directory ctermfg=LightBlue

"EOF
