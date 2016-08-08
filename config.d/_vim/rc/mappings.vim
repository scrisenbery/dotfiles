"
" Make Y behave like C and D
"
nnoremap Y y$

"
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null
