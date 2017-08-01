"
" Make Y behave like C and D
"
nnoremap Y y$

" //TODO Error message: Error detected while processing
" /Users/scrisenbery/projects/dotfiles/config.d/_vim/rc/mappings.vim:
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
