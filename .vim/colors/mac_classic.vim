" Vim color scheme

set background=light
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "mac_classic"


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
hi Cursor  guifg=#FFFFFF ctermfg=15 guibg=#3C4C72 ctermbg=240
hi Visual  guibg=#C6DEFF ctermbg=189
hi CursorLine  guibg=#F0F6FF ctermbg=231
hi CursorColumn  guibg=#F0F6FF ctermbg=15
hi LineNr  guifg=#808080 ctermfg=244 guibg=#EFEFEF ctermbg=231
hi VertSplit  guifg=#FFFFFF ctermfg=15 guibg=#CFCFCF ctermbg=252 gui=NONE
hi MatchParen  guifg=#1E39F6 ctermfg=27 guibg=NONE gui=bold
hi Pmenu guibg=#EFEFEF ctermbg=7
hi PmenuSel  guibg=#C6DEFF ctermbg=189
hi Directory  guifg=#D51015 ctermfg=88

" StatusLine:
hi StatusLine  guifg=#000000 ctermfg=0 guibg=#C6DEFF ctermbg=189 gui=italic
hi StatusLineNC  guifg=#000000 ctermfg=0 guibg=#EFEFEF ctermbg=7 gui=NONE

" Search:
" [IncSearch is stronger than Search]
hi IncSearch  guifg=NONE guibg=#FFCE77 ctermbg=222 gui=NONE
hi Search  guibg=#FFE6BB ctermbg=223

" Syntax:
hi Normal  guifg=#000000 ctermfg=0 guibg=#FFFFFF ctermbg=231
hi Boolean  guifg=#6E79F1 ctermfg=69 gui=bold
hi Character  guifg=#D51015 ctermfg=160 gui=bold
hi Comment  guifg=#0066FF ctermfg=27 gui=italic
hi Conditional  guifg=#1E39F6 ctermfg=27 gui=bold
hi Constant  guifg=#D51015 ctermfg=160 gui=bold
hi Define  guifg=#1E39F6 ctermfg=27 gui=bold
hi ErrorMsg  guifg=#FFFFFF ctermfg=15 guibg=#990000 ctermbg=88
hi WarningMsg  guifg=#FFFFFF ctermfg=15 guibg=#990000 ctermbg=88
hi Float  guifg=#0000A2 ctermfg=19
hi Function  guifg=#0000A2 ctermfg=19 gui=bold
hi Identifier  guifg=#1E39F6 ctermfg=27 gui=bold
hi Keyword  guifg=#1E39F6 ctermfg=27 gui=bold
hi Label  guifg=#007B22 ctermfg=28
hi Number  guifg=#0000A2 ctermfg=19
hi Operator  guifg=#1E39F6 ctermfg=27 gui=bold
hi PreProc  guifg=#1E39F6 ctermfg=27 gui=bold
hi Special  guifg=#000000 ctermfg=0
hi Statement  guifg=#1E39F6 ctermfg=27 gui=bold
hi StorageClass  guifg=#1E39F6 ctermfg=27 gui=bold
hi String  guifg=#007B22 ctermfg=28
hi Title  guifg=#000000 ctermfg=0 gui=bold
hi Todo  guifg=#0066FF ctermfg=27 gui=inverse,bold,italic
hi Underlined  gui=underline

" Invisible character colors
hi NonText  guifg=#DFDFDF ctermfg=253 guibg=#FFFFFF ctermbg=15
hi SpecialKey  guifg=#DFDFDF ctermfg=253 guibg=#FFFFFF ctermbg=15
