set nocompatible  " settings for vim, not vi!

set encoding=utf-8  " set encoding to UTF-8
let mapleader=","   " change leader to ,


" === VISUALS === "
colo badwolf  " color scheme
syntax on     " syntax highlighting

set cursorline  " highlight the current line
set nu rnu      " hybrid line numbering

set lazyredraw  " don't redraw when it's necessary 
set timeoutlen=1000 ttimeoutlen=0  " no delay after exiting visual mode

" === TABS === "
set tabstop=4  " 4 spaces as a tab
set expandtab  " make tabs spaces

set shiftwidth=4            " 4 inserted spaces when indenting
set smartindent autoindent  " smarter, automatic indenting

set nowrap       " disable word wrap
set linebreak    " break on words if wrap is enabled
set breakindent  " indent broken lines if wrap is enabled

set showcmd   " shows last issued command
set wildmenu  " show command suggestions


" === SEARCH === "
set incsearch   " search as we type
set hlsearch    " highlight search
set ignorecase  " ignore search case...
set smartcase   " ...unless we type a capital

" hide search results with leader + space
nnoremap <leader><space> :nohlsearch<CR>


" === EDITING === "
" don't skip wrapped lines
nnoremap j gj
nnoremap k gk


" === TEMPORARY === "
" disable up/down/left/right keys for better habbits
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


" === MISCELLANEOUS === "
set history=1000  " more history!

set autochdir " automatically change dir to current file

" disable bells
set visualbell
set t_vb=


" === SPELLCHECK === "
" add czech and english spellchecking commands
command Spc  :set spell spelllang=cz
command Spe  :set spell spelllang=en_us
command Nosp :set nospell

" underline incorrect words (since BadWolf doesn't for some reason)
hi SpellBad cterm=underline


" === PlUGINS === "
" vimwiki plugin settings
filetype plugin on
let g:vimwiki_list = [{'path': '~/Documents/Wiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_table_mappings = 0

" ultisnips plugin settings
let g:UltiSnipsSnippetsDir=$HOME.'/.vim/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
