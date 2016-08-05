" //TODO Review Neobundle vs Vundle vs whatever and review/update/replace this

" Load all the plugins automatically on startup
" TODO Maloy does the opposite here. I suspect the difference is that Matt
" could lazy load via NeoBundle but I doubt Vundle has that so I suspect
" Maloy's approach is the correct one here. I will have to check. Loading all
" plugins on start is not necessarily ideal
filetype off
filetype plugin indent off

" Increase timeout for YouCompleteMe
let g:neobundle#install_process_timeout=300

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  set runtimepath+=~/.vim/rc/plugins/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

runtime! rc/plugins/*.vim

call neobundle#end()

filetype plugin indent on
syntax on

NeoBundleCheck
