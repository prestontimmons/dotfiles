" Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug
call plug#begin('~/.vim/plugged')
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'rust-lang/rust.vim'
    Plug 'posva/vim-vue'
    Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'arzg/vim-substrata'
call plug#end()

" More information can be found about settings by
" typing :help or :help <setting>

" settings
set nocompatible  " do not be compatible with vi

let mapleader = ","

" Restore cursor to last edited position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" make vertical movement within wrapped lines easier
noremap j gj
noremap k gk

" Map shift-k to k
nmap K k
vmap K k

" Buffer navigation
nmap t :bn<cr>
nmap T :bp<cr>

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
set hidden         " hidden buffers
set notitle

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

" Split options
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Smart indenting
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Stop smartindent from unindenting python comments
autocmd BufRead *.py inoremap # X<c-h>#<space>

" Disable syntax highlighting for markdown
autocmd BufRead {*.md} set filetype=markdown
" autocmd FileType markdown setlocal syntax=off

" Store swap files in ~/.vim/swap
set backupdir=~/.vim/swap/,.
set directory=~/.vim/swap/,.

" On save, set file format to unix always
autocmd BufWrite * set fileformat=unix

" Remove trailing whitespace from file
nmap <silent> <leader>f :%s/\s\+$//ge<cr>

" Toggle paste mode
nmap <leader>p :set invpaste paste?<cr>

" Open a new explorer buffer
nmap - :Ex<cr>
nmap <leader>t :Ex<cr>

" FZF
nmap <leader>g :GFiles<cr>
nmap <leader>G :GFiles?<cr>
nmap <leader>r :Rg<cr>

" Delete DOS carriage returns
nmap <silent> <leader>m :%s/\r//g<cr>

" Toggle line-wrapping
nmap <leader>w :set wrap!<cr>

" Toggle line numbers
nmap <leader>n :set number!<cr>

" Change the working directory to the current file always
set autochdir

" <C-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR>:cclose<CR>:lclose<CR><C-l>

" Hide pyc files in file explorer (:help netrw_list_hide)
let g:netrw_list_hide= ".*\.pyc$,*\.pyo$,.*\.swp$,*.DS_Store$"
let g:netrw_fastbrowse = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 1
let g:netrw_keepdir = 0
let g:netrw_sort_by = "name"

" Indent toggle
nmap <leader>s :set tabstop=4\|set softtabstop=4\|set shiftwidth=4<cr>
nmap <leader>a :set tabstop=2\|set softtabstop=2\|set shiftwidth=2<cr>

" HTML settings
autocmd FileType html setlocal noexpandtab shiftwidth=2 tabstop=2 softtabstop=2

" Convert html tags to lowercase
autocmd FileType html nmap <leader>z :%s/<\/\?\zs\(\a\+\)\ze[ >]/\L\1/g<cr>

" Escape html tags
function HtmlEscape()
    silent s/&/\&amp;/ge
    silent s/</\&lt;/ge
    silent s/>/\&gt;/ge
    silent s/"/\&quot;/ge
endfunction

autocmd FileType html vmap <leader>h :call HtmlEscape()<CR>

" C settings
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

" Go settings
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
" nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T
let g:go_fmt_command = "goimports"
let g:go_fmt_experimental = 1
let g:go_list_type = "quickfix"
let g:go_jump_to_error = 0
" let g:go_def_reuse_buffer = 0
" let g:go_auto_type_info = 1

autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>m <Plug>(go-metalinter)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>d <Plug>(go-diagnostics)
autocmd FileType go nmap <silent> <leader>v <Plug>(go-vet)<cr>
autocmd FileType go nmap <leader>r :GoIfErr<CR>
autocmd FileType go nmap <leader>i <Plug>(go-info)

" Rust settings
let g:rustfmt_autosave = 1

" Autocomplete
set completeopt=menuone,longest,noinsert
set shortmess+=c                " Shut off completion messages
autocmd CompleteDone * pclose

" Move up and down in autocomplete with j and k
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" Make enter select highlighted entry
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Wrap location-list
augroup LocationList
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" EasyAlign
vmap <leader><Bslash> :EasyAlign*<Bar><Enter>

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#show_number  = 1
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
set showtabline=2

" Color scheme
if $COLORTERM == 'truecolor' || exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    colorscheme substrata
    set noshowmode
    set laststatus=2
    let g:lightline.colorscheme = 'nord'
    hi Normal guibg=NONE ctermbg=NONE
endif
