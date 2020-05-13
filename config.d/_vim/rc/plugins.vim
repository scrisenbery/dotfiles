" Load all the plugins automatically on startup
filetype off
filetype plugin indent off

if has('vim_starting')
  " Not vi-compatible
  set nocompatible
  " Set the runtime path to include Vundle
  set runtimepath+=~/.vim/bundle/Vundle.vim/
  " Add to runtime path so it can be called later and grab all files
  set runtimepath+=~/.vim/rc/plugins/
endif

" Initialize and specify where Vundle should install plugins
call vundle#begin(expand('~/.vim/bundle/'))

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Source all files from plugins dir
" Allows me to keep each plugin in its own file, which is great for plugins
" which have settings that need to be managed also
" Ref: https://github.com/mtscout6/dotfiles/blob/master/_vim/rc/plugins.vim
runtime! rc/plugins/*.vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
