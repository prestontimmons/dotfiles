" Vim color scheme

set background=light
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "bluish"


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

" 0 - #00000
" 18 - #000087 blue1
" 32 - blue2
" 231 - #ffffff

" Search:
" [IncSearch is stronger than Search]
hi IncSearch ctermbg=222
hi Search ctermbg=223

" Syntax:
hi Normal ctermfg=0 ctermbg=231
hi Boolean ctermfg=69
hi Character ctermfg=160
hi Comment ctermfg=27
hi Conditional ctermfg=68
hi Constant ctermfg=160
hi Define ctermfg=27
hi ErrorMsg ctermfg=15 ctermbg=88
hi WarningMsg ctermfg=15 ctermbg=88
hi Float ctermfg=19
hi Function ctermfg=18
hi Identifier ctermfg=27
hi Keyword ctermfg=27
hi Label ctermfg=28
hi Number ctermfg=19
hi Operator ctermfg=27
hi PreProc ctermfg=27
hi Special ctermfg=0
hi Statement ctermfg=27
hi StorageClass ctermfg=27
" hi String ctermfg=28
hi String ctermfg=18
hi Title ctermfg=0
hi Todo ctermfg=27

" Invisible character colors
hi NonText ctermfg=253 ctermbg=15
hi SpecialKey ctermfg=253 ctermbg=15
