" Indent
set cindent
set autoindent
set smartindent

" Tab
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set nowrap

" Line
set number

" Pair matching
set matchpairs+=<:>
set showmatch

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" vim-plug automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Vim plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Initialize plugin system
call plug#end()

" set *.tsx filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" dark red
execute 'hi tsxTagName ctermfg=168'
hi link tsxComponentName tsxTagName
execute 'hi tsxCloseTagName ctermfg=174'
hi link tsxCloseComponentName tsxCloseTagName

" orange
execute 'hi tsxCloseString ctermfg=210'
execute 'hi tsxTag ctermfg=210'
execute 'hi tsxCloseTag ctermfg=216'
execute 'hi tsxAttributeBraces ctermfg=210'
execute 'hi tsxEqual ctermfg=210'

" yellow
execute printf('hi tsxAttrib ctermfg=216')

