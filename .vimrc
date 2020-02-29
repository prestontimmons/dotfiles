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
    Plug 'racer-rust/vim-racer'
    Plug 'posva/vim-vue'
    Plug 'lifepillar/vim-mucomplete'
    Plug 'vim-syntastic/syntastic'
    Plug 'relastle/bluewery.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
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

" Open a new explorer tab
nmap <leader>t :tabe\|:Ex<cr>

" FZF search shortcuts
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command], 'dir': system('git rev-parse --show-toplevel 2> /dev/null')[:-2]}
  call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nmap <leader>u :tabe\|:GFiles<cr>
nmap <leader>U :tabe\|:RG<cr>

" Delete DOS carriage returns
nmap <silent> <leader>m :%s/\r//g<cr>

" Toggle line-wrapping
nmap <leader>w :set wrap!<cr>

" Toggle line numbers
nmap <leader>n :set number!<cr>

" Change the working directory to the current file always
autocmd BufEnter,BufWritePost * lcd %:p:h

" <C-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR>:cclose<CR>:lclose<CR><C-l>

" Hide pyc files in file explorer (:help netrw_list_hide)
let g:netrw_list_hide= ".*\.pyc$,*\.pyo$,.*\.swp$"
let g:netrw_fastbrowse = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 1

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
let g:go_list_type = "quickfix"
let g:go_jump_to_error = 0
" let g:go_def_reuse_buffer = 0
" let g:go_auto_type_info = 1

autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>m <Plug>(go-metalinter)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <silent> <leader>v <Plug>(go-vet)<cr>
autocmd FileType go nmap <leader>d <Plug>(go-def-tab)
autocmd FileType go nmap <leader>r :GoIfErr<CR>
autocmd FileType go nmap <leader>i <Plug>(go-info)

" Rust settings
let g:rustfmt_autosave = 1
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> <C-]>      <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
augroup END

" Autocomplete
set completeopt=menuone,longest,noselect
set shortmess+=c                " Shut off completion messages
autocmd CompleteDone * pclose

" Move up and down in autocomplete with j and k
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))

" Make enter select highlighted entry
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#completion_delay = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set scl=yes

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1

" Wrap location-list
augroup LocationList
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" EasyAlign
au FileType markdown vmap <leader><Bslash> :EasyAlign*<Bar><Enter>

" Color scheme

if $COLORTERM == 'truecolor'
    set termguicolors
    colorscheme bluewery
    hi! LineNr guibg=#142c35

    set noshowmode
    set laststatus=2
    let g:lightline = { 'colorscheme': 'bluewery' }
else
    set background=light
    highlight clear

    if exists("syntax_on")
      syntax reset
    endif

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
    hi IncSearch  ctermbg=222
    hi Search  ctermbg=223
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
    hi NonText  ctermfg=253
    hi SpecialKey  ctermfg=253 ctermbg=15
    highlight clear TabLine
    hi Tabline cterm=underline
endif
