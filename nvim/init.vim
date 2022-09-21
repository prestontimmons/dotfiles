" Install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug
call plug#begin('~/.vim/plugged')
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'

    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'

    Plug 'rust-lang/rust.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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
let g:netrw_liststyle = 1
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

"" C settings
augroup project
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.c set filetype=c
augroup END

"" Go settings
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_jump_to_error = 0

autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>m <Plug>(go-metalinter)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <silent> <leader>v <Plug>(go-vet)<cr>
autocmd FileType go nmap <leader>d <Plug>(go-def-tab)
autocmd FileType go nmap <leader>r :GoIfErr<CR>
autocmd FileType go nmap <leader>i <Plug>(go-info)

" Rust settings

let g:rustfmt_autosave = 1

" EasyAlign
au FileType markdown vmap <leader><Bslash> :EasyAlign*<Bar><Enter>

let g:mkdp_auto_close = 0

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
if $COLORTERM == 'truecolor'
    set termguicolors
    colorscheme substrata
    set noshowmode
    set laststatus=2
    let g:lightline.colorscheme = 'nord'
endif

" COC

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
