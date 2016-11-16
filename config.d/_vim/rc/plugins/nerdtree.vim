Plugin 'scrooloose/nerdtree'

" Shows hidden files by default
let NERDTreeShowHidden=1
" List of regex - ignores matching files when listing
let NERDTreeIgnore=[]

" Key remapping
nnoremap <TAB> :NERDTreeToggle<CR>
nnoremap <leader>ff :NERDTreeFind<CR>



" Plugin for NerdTree: operating from same file to ensure order
" Shows symbols to reference git status in tree
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Symbol mapping:
"let g:NERDTreeIndicatorMapCustom = {
    "\ "Modified"  : "✹",
    "\ "Staged"    : "✚",
    "\ "Untracked" : "✭",
    "\ "Renamed"   : "➜",
    "\ "Unmerged"  : "═",
    "\ "Deleted"   : "✖",
    "\ "Dirty"     : "✗",
    "\ "Clean"     : "✔︎",
    "\ "Unknown"   : "?"
    "\ }
