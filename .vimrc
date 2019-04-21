let mapleader=","  " change leader to ,

colo badwolf  " color scheme
syntax on     " syntax highlighting
set cursorline  " highlight the current line

set tabstop=4  " 4 spaces as a tab
set expandtab  " make tabs spaces

set shiftwidth=4            " 4 inserted spaces when indenting
set smartindent autoindent  " smarter, automatic indenting

set nu rnu  " hybrid line numbering

set nowrap    " disable word wrap
set linebreak " enable linebreak when word wrap is enabled

set showcmd   " shows last issued command
set wildmenu  " show command suggestions

" search settings
set incsearch
set hlsearch
set ignorecase
nnoremap <leader><space> :nohlsearch<CR>

set lazyredraw  " don't redraw when it's necessary 
" don't skip wrapped lines
nnoremap j gj
nnoremap k gk

set history=1000  " more history!

set autochdir " automatically changes dir

" disable the bells
set visualbell
set t_vb=

" for vimwiki plugin
set nocompatible
filetype plugin on

let g:vimwiki_list = [{'path': '~/Wiki/', 'syntax': 'markdown', 'ext': '.md'}]
