set nocompatible  " settings for vim, not vi!

set encoding=utf-8  " set encoding to UTF-8
let mapleader=","   " change leader to ,


" === VISUALS === "
colo badwolf  " color scheme
syntax on     " syntax highlighting

set cursorline  " highlight the current line
set nu          " line numbering

set lazyredraw  " don't redraw when it it's necessary 
set timeoutlen=1000 ttimeoutlen=0  " no delay after exiting visual mode

set colorcolumn=88  " ruler


" === TABS === "
set tabstop=4  " 4 spaces as a tab

set shiftwidth=4            " 4 inserted spaces when indenting
set smartindent autoindent  " smarter, automatic indenting


" === OTHER === "
set nowrap       " disable word wrap
set linebreak    " break on words if wrap is enabled
set breakindent  " indent broken lines if wrap is enabled

set showcmd   " shows last issued command
set wildmenu  " show command suggestions

set undofile  " persistent undo

set scrolloff=4  " always have min. 4 lines above/below


" === SEARCH === "
set incsearch hlsearch    " search (and highlight) as we type
set ignorecase smartcase  " ignore search case, unless we type a capital

" hide search results with leader + space
nnoremap <leader><space> :nohlsearch<CR>


" === EDITING === "
" don't skip wrapped lines
nnoremap j gj
nnoremap k gk

" split navigation
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" more natural splitting
set splitbelow splitright

" automatic split resize
autocmd VimResized * wincmd =


" === BUFFER BINDINGS === "
" bind ctrl + move buttons to move tabs
nnoremap H :bnext<CR>
nnoremap L :bprevious<CR>


" === RUNNING FILES === "
command Rpy :w | !py %<cr>


" === FILETYPE-SPECIFIC BEHAVIOR === "
" decrease indentation in Tex documents
autocmd FileType tex setlocal tabstop=2 shiftwidth=2

" reformat Python files after saving using Black
autocmd BufWritePre *.py execute ':Black'
autocmd FileType py Spe

" ulify tex flavors, since I really only work with LaTeX
let g:tex_flavor = "latex"


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
command Spc :set spell spelllang=cz
command Spe :set spell spelllang=en_us
command Spn :set nospell

" highlight incorrect words (since BadWolf doesn't)
hi SpellBad ctermfg=red
hi SpellBad cterm=underline


" === PlUGINS === "
" vimwiki plugin settings
filetype plugin on
let g:vimwiki_list = [{'path': '~/Documents/Wiki/', 'diary_rel_path': 'Diary/', 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_table_mappings = 0  "disable tab mappings in insert mode 
let g:vimwiki_global_ext = 0  " don't use vimwiki format for other md files

" ultisnips plugin settings
let g:UltiSnipsSnippetsDir=$HOME.'/.vim/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:UltiSnipsEditSplit="tabdo"  " split into tabs

" airline plugin
let g:airline_powerline_fonts=1
