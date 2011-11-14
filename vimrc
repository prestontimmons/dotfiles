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

" Set backup files to a single directory
set backupdir=~/tmp,.

" On save, set file format to unix always
autocmd BufWrite * set fileformat=unix

" Map shift-k to k
nmap <S-k> k

" Control-o: Set tabstop for 4
map <C-o> :set tabstop=4\|set softtabstop=4\|set shiftwidth=4<cr>

" Control-p: Set tabstop for 2
map <C-p> :set tabstop=2\|set softtabstop=2\|set shiftwidth=2<cr>

" Convert html tags to lowercase
map <f6> :%s/<\/\?\zs\(\a\+\)\ze[ >]/\L\1/g<cr>
nmap <f7> I<p></p>j<f7>

" Remove trailing whitespace from file
nmap <silent> ,a :%s/\s\+$//ge<cr>

" Toggle paste mode
nmap ,p :set invpaste paste?<cr>

" Open a new tabe in the explorer window
nmap ,t :tabe\|:Ex<cr>

" Delete DOS carriage returns
nmap ,m :%s/\r//g<cr>

" Change the working directory to the current file always
autocmd BufEnter,BufWritePost * lcd %:p:h

" <C-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Hide pyc files in file explorer (:help netrw_list_hide)
let g:netrw_list_hide= ".*\.pyc$,*\.pyo$,.*\.swp$"

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
