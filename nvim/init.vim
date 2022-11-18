" Install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug
call plug#begin('~/.vim/plugged')
    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
    Plug 'rust-lang/rust.vim'
    Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'
    Plug 'junegunn/vim-easy-align'
    Plug 'arzg/vim-substrata'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Leader
let mapleader = ","

" Restore cursor to last edited position
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" searching and patterns (search with /<pattern>)
set ignorecase              " search is case insensitive
set smartcase               " search case sensitive if caps on

" display
set scrolloff=3             " keep 3 lines below and above the cursor when scrolling
set number                  " show line numbering
set foldlevelstart=99
set hidden                  " hidden buffers
set notitle
set signcolumn=number
set shortmess+=c
set cmdheight=2

" editing
set backspace=2             " backspace over anything
set showmatch               " highlight matched parenthesis
set formatoptions-=tc
set tabstop=4               " tab stop of 4
set shiftwidth=4            " sw 4 spaces (used on auto indent)
set softtabstop=4           " 4 spaces as a tab for bs/del

" coding
set history=1000            " 1000 Lines of history
filetype indent on          " enable filetype indent
filetype plugin on          " enable filetype plugins
filetype plugin indent on   " let filetype plugins indent for me
syntax enable               " turn on syntax highlighting

" Set default options
set expandtab               " expand tab characters to spaces
set nowrap                  " default to no text wrap
set linebreak               " make text-wrapping nicer

" Split options
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" File explorer
let g:netrw_list_hide= ".*\.pyc$,*\.pyo$,.*\.swp$,*.DS_Store$"
let g:netrw_fastbrowse = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 4
let g:netrw_keepdir = 0
let g:netrw_sort_by = "exten"

" Wrap location-list
augroup LocationList
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

" Set file format to unix always
autocmd BufWrite * set fileformat=unix

" Make vertical movement within wrapped lines easier
noremap j gj
noremap k gk

" Map shift-k to k
nmap K k
vmap K k

" Buffer navigation
nmap t :bn<cr>
nmap T :bp<cr>

" Set updatetime for CursorHold
set updatetime=500

" Remove trailing whitespace from file
nmap <silent> <leader>fw :%s/\s\+$//ge<cr>

" Toggle paste mode
nmap <leader>p :set invpaste paste?<cr>

" Open a new explorer buffer
nmap <leader>t :enew\|:Ex<cr>
nmap <leader>q :bd<cr>
nmap <leader>o :%bd <bar> e# <bar> bd#<cr>

" FZF
nmap <leader>g :GFiles<cr>
nmap <leader>G :GFiles?<cr>

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

" Indent toggle
nmap <leader>s :set tabstop=4\|set softtabstop=4\|set shiftwidth=4<cr>
nmap <leader>a :set tabstop=2\|set softtabstop=2\|set shiftwidth=2<cr>

"" HTML settings
autocmd FileType html setlocal noexpandtab shiftwidth=2 tabstop=2 softtabstop=2

"" C settings
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

" Rust settings

let g:rustfmt_autosave = 1

" EasyAlign
au FileType markdown vmap <leader><Bslash> :EasyAlign*<Bar><Enter>

" Markdown preview settings
let g:mkdp_auto_close = 0

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {},
      \ }
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#unnamed      = '[No Name]'
let g:lightline#bufferline#show_number  = 1
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
set showtabline=2

" Color scheme
if $COLORTERM == 'truecolor'
    set termguicolors
    colorscheme substrata
    set noshowmode
    set laststatus=2
    let g:lightline.colorscheme = 'nord'
endif

" COC

" Shortcuts
nmap <silent> <leader>d <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>D <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>r <Plug>(coc-rename)
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

hi DiagnosticUnderlineError cterm=None gui=None
hi DiagnosticUnderlineWarn cterm=None gui=None
hi DiagnosticUnderlineHint cterm=None gui=None
hi Conceal gui=None guifg=None guibg=None
