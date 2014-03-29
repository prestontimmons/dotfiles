" More information can be found about settings by
" typing :help or :help <setting>
"
" settings
set nocompatible  " do not be compatible with vi

" This beauty remembers where you were the last time you edited the file, and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" make vertical movement within wrapped lines easier
noremap j gj
noremap k gk

" Map shift-k to k
nmap K k
vmap K k

" searching and patterns (search with /<pattern>)
set ignorecase " search is case insensitive
set smartcase  " search case sensitive if caps on
set incsearch  " show best match so far
set hlsearch   " highlight matches to the search

" display
set lazyredraw     " do not repaint when scripts are running
set scrolloff=3    " keep 3 lines below and above the cursor when scrolling
set ruler          " show line numbers and column the cursor is on in status bar
set number         " show line numbering
set foldlevelstart=99
set t_Co=256

" editing
set backspace=2        " backspace over anything
set showmatch          " highlight matched parenthesis
set matchtime=2        " length of time to show matched parenthesis (milliseconds)
set formatoptions-=tc
set tabstop=4          " tab stop of 4
set shiftwidth=4       " sw 4 spaces (used on auto indent)
set softtabstop=4      " 4 spaces as a tab for bs/del

" don't tab complete these types of files
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.pyo,*.swp

" coding
set history=1000           " 1000 Lines of history
filetype indent on         " enable filetype indent
filetype plugin on         " enable filetype plugins
filetype plugin indent on  " let filetype plugins indent for me
syntax enable              " turn on syntax highlighting

" Set default options
set expandtab  " expand tab characters to spaces
set autoindent " use auto-indentation
set smarttab   " indent based on context
set nowrap     " default to no text wrap
set linebreak  " make text-wrapping nicer
set enc=utf-8  " set default encoding to utf-8

" Smart indenting
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Stop smartindent from unindenting python comments
autocmd BufRead *.py inoremap # X<c-h>#<space>

" Set backup files to a single directory
set backupdir=~/.vim//,.
set directory=~/.vim//,.

" On save, set file format to unix always
autocmd BufWrite * set fileformat=unix

" Set tabstop for 4
map ,s :set tabstop=4\|set softtabstop=4\|set shiftwidth=4<cr>

" Set tabstop for 2
map ,a :set tabstop=2\|set softtabstop=2\|set shiftwidth=2<cr>

" Convert html tags to lowercase
nmap ,z :%s/<\/\?\zs\(\a\+\)\ze[ >]/\L\1/g<cr>

" Remove trailing whitespace from file
nmap <silent> ,f :%s/\s\+$//ge<cr>

" Toggle paste mode
nmap ,p :set invpaste paste?<cr>

" Open a new tabe in the explorer window
nmap ,t :tabe\|:Ex<cr>

" Delete DOS carriage returns
nmap <silent> ,m :%s/\r//g<cr>

" Toggle line-wrapping
nmap ,w :set wrap!<cr>

" Toggle line numbers
nmap ,n :set number!<cr>

" Change the working directory to the current file always
autocmd BufEnter,BufWritePost * lcd %:p:h

" <C-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Hide pyc files in file explorer (:help netrw_list_hide)
let g:netrw_list_hide= ".*\.pyc$,*\.pyo$,.*\.swp$"

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Escape html tags
function HtmlEscape()
  silent s/&/\&amp;/ge
  silent s/</\&lt;/ge
  silent s/>/\&gt;/ge
  silent s/"/\&quot;/ge
endfunction

map <silent> ,h :call HtmlEscape()<CR>

" Escape Django brackets
function DjangoEscape()
  silent s/{/\&#123;/ge
  silent s/}/\&#125;/ge
endfunction

map <silent> ,d :call DjangoEscape()<CR>


" Vim color scheme

set background=light
highlight clear

if exists("syntax_on")
  syntax reset
endif

" Colors:
"
" #000000 - black
" #3C4C72 - BLUE/GREY - cursor, rails helpers
" #0000A2 - D.BLUE - numbers & function names
" #1E39F6 - BLUE
" #0066FF - L.BLUE - Comments, TODOs and folds
" #6E79F1 - L.PURPLE - Booleans, Ruby Constants & CSS definitions
" #318495 - BLUE/GREEN - Ruby instance/global/pseudo variables
" #007B22 - D.GREEN - Strings, Labels and code blocks in Markdown
" #00BC41 - L.GREEN - CSS common attributes & ruby interpolation
" #990000 - BURGUNDY - Errors and Warnings
" #D51015 - RED for constants, symbols, numbers
" #E18AC7 - PINK RegularExpressions in Ruby
" #FFCE77 - ORANGE - Incremental Search
" #FFE6BB - L.ORANGE - Search
" #C6DEFF - VL.BLUE Visual, Current StatusLine & AutoComplete selection
" #808080 - Line numbers
" #CFCFCF - VerticalSplit separator
" #DFDFDF - Invisible Characters
" #EFEFEF - LineNumber & Non-Current StatusLine
" #F0F6FF - CursorLine & CursorColumn
" #FFFFFF - WHITE

" GUI:
hi Cursor  ctermfg=15 ctermbg=240
hi Visual  ctermbg=189
hi CursorLine  ctermbg=231
hi CursorColumn  ctermbg=15
hi LineNr  ctermfg=244
hi VertSplit  ctermfg=15 ctermbg=252
hi MatchParen  ctermfg=27
hi Pmenu ctermbg=7
hi PmenuSel  ctermbg=189
hi Directory  ctermfg=88

" Search:
" [IncSearch is stronger than Search]
hi IncSearch  ctermbg=222
hi Search  ctermbg=223

" Syntax:
" hi Normal  ctermfg=0 ctermbg=231
hi Normal  ctermfg=0
hi Boolean  ctermfg=69
hi Character  ctermfg=160
hi Comment  ctermfg=27
hi Conditional  ctermfg=27
hi Constant  ctermfg=160
hi Define  ctermfg=27
hi ErrorMsg  ctermfg=15 ctermbg=88
hi WarningMsg  ctermfg=15 ctermbg=88
hi Float  ctermfg=19
hi Function  ctermfg=19
hi Identifier  ctermfg=27
hi Keyword  ctermfg=27
hi Label  ctermfg=28
hi Number  ctermfg=19
hi Operator  ctermfg=27
hi PreProc  ctermfg=27
hi Special  ctermfg=0
hi Statement  ctermfg=27
hi StorageClass  ctermfg=27
hi String  ctermfg=28
hi Title  ctermfg=0
hi Todo  ctermfg=27

" Invisible character colors
hi NonText  ctermfg=253
hi SpecialKey  ctermfg=253 ctermbg=15


highlight clear TabLine
hi Tabline cterm=underline
