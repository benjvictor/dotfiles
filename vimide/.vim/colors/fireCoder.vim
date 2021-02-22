hi clear
if exists("syntax_on")
  syntax reset
endif

set bg=dark

"set g:colors_name="fire-coder"

" :help syntax.txt

" invoke: call Coloring('Comment', '0', '1', '2')
function! Coloring(group, cterm, ctermbg, ctermfg)
  let highlightstr = 'highlight ' . a:group . ' '
  let highlightstr .= 'ctermbg=' . a:ctermbg . ' '
  let highlightstr .= 'ctermfg=' . a:ctermfg . ' '
  let highlightstr .= 'cterm=' . a:cterm . ' '

  execute histring
endfunction

" vimrc config highlighting
so ~/dotfiles/vimide/.vim/rc-conf/color_cursor.vim
so ~/dotfiles/vimide/.vim/rc-conf/color_txt.vim
so ~/dotfiles/vimide/.vim/rc-conf/editor.vim
so ~/dotfiles/vimide/.vim/rc-conf/over_80.vim

hi Comment    cterm=none ctermfg=238
hi Type       cterm=bold ctermfg=123 " Type
hi PreProc    cterm=none ctermfg=088 " bold
hi Special    cterm=none ctermfg=124 " <ESC>
hi Statement  cterm=none ctermfg=228 " hi 172,166,214,195,230,145,124
hi Identifier cterm=bold ctermfg=075 " a:newstate
hi Constant   cterm=none ctermfg=039 " 039
hi Underlined cterm=none ctermfg=100
hi LineNr ctermfg=006 ctermbg=0 cterm=none

" to link groups: hi link x y

" comment 238 (gray)
" type 123, alt: 116, 117 (light blue)
" preproc 88, alt: 124, 52 (dark red)
" speical 124, alt: 203, 196 (red)
" statement 228, alt: 186, 178, 179, 172, 221 (yellow)
" identifier 75, (blue) see blue or cyan
" constant 39, (blue) see blue or cyan
" underlined 100, (orange) see orange

" blue (45, 150, 225) : 32, 38, 39, 33
" light blue (150, 215, 235) : 117, 116, 153, 152
" red (245, 50, 75) : 203 (196)
" dark red (115, 25, 30) : 124, 88, 52
" red 2 (240, 50, 60) : 160, 166, 167
" cyan (115, 195, 210) : 116, [110, 109, 111], [80, 81, 79], [73, 74, 75]
" white (250, 250, 240) : 231-243
" gray (170, 185, 200) : 7, 8, 244+
" orange (250, 150, 85) : 208, 214, 215, 221, 202
" yellow (230, 220, 115) : 186, 178, 179, 172, 221

" light cyan (0, 185, 185) : 37, 44, 31, 30
" dark cyan (0, 128, 128) : 6
" cyan 2 (100, 115, 135) : 66-69

" List of colours by name (palette)
" blue
" light blue
" red
" dark red
" cyan
" dark cyan
" light cyan
" cyan 2
" white
" gray
" orange
" yellow

" List of all 256 interested
" 6
" 30
" 31
" 32
" 33
" 37
" 38
" 39
" 44
" 52
" 66
" 67
" 69
" 73
" 74
" 75
" 79
" 80
" 81
" 88
" 109
" 110
" 111
" 116
" 117
" 124
" 152
" 153
" 160
" 166
" 167
" 172
" 178
" 179
" 186
" 196
" 202
" 203
" 208
" 214
" 215
" 221
"