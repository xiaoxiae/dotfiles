set nocompatible  " settings for Vim, not Vi!

set encoding=utf-8  " set encoding to UTF-8
let mapleader=","   " change leader to , (easier to reach)


" === VISUALS === "
colo badwolf  " color scheme
syntax on     " syntax highlighting

set cursorline  " highlight the current line
set nu          " line numbering

set signcolumn=number  " merge sign column and line numbers

set lazyredraw  " don't redraw when it it's necessary 
set timeoutlen=1000 ttimeoutlen=0  " no delay after exiting visual mode

set colorcolumn=88  " ruler (inspired by Python's Black)


" === TABS === "
set tabstop=4 shiftwidth=4  " tab is 4 characters wide
set autoindent smartindent  " smart indenting
filetype plugin indent on   " indenting


" === OTHER === "
set nowrap       " disable word wrap
set linebreak    " break on words if wrap is enabled
set breakindent  " indent broken lines if wrap is enabled

set showcmd   " shows last issued command
set wildmenu  " show command suggestions

set undofile  " persistent undo

set hidden    " allow hidden buffers

set scrolloff=4  " always have min. 4 lines above/below


" === SEARCH === "
set incsearch hlsearch    " search (and highlight) as we type
set ignorecase smartcase  " ignore search case, unless we type a capital

set path+=**  " search in subdirectories

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
" bind shift + h/l buttons to move between buffers
nnoremap H :bnext<CR>
nnoremap L :bprevious<CR>


" === CUSTOM COMMANDS === "
" run Python files
command Rpy :w | !py %<cr>

" run C files
command Rc :w | !gcc % -o %:r && ./%:r<cr>

" insert Xournal++ note
command Diagram :call InsertXournalppNote()
function! InsertXournalppNote()
  :let l:file_name = strftime('%y-%d-%m_%H-%M-%S.xopp')
  :silent exec "!mkdir -p diagrams/"
  :silent exec "!cp /opt/blank_xournalpp_file.xopp diagrams/" . l:file_name
  :silent exec "!xournalpp diagrams/" . l:file_name . " &" | redraw!
  :exec ":normal i" . "[](diagrams/" . l:file_name . ")"
  :normal F[
endfunction


" === FILETYPE-SPECIFIC BEHAVIOR === "
" decrease indentation in Tex documents
autocmd FileType tex  setlocal tabstop=2 shiftwidth=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2

" markdown indentation and filetype
autocmd FileType markdown setlocal ft=vimwiki
autocmd FileType vimwiki  setlocal wrap

" Python spell check and auto format
autocmd FileType python  execute ':Spe'
autocmd BufWritePre *.py execute ':Black'

" unify tex flavors, since I really only work with LaTeX
let g:tex_flavor = "latex"


" === TEMPORARY === "
" disable up/down/left/right keys for better habits
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>


" === MISCELLANEOUS === "
set history=1000  " more history!

" disable bells
set visualbell
set t_vb=


" === SPELLCHECK === "
" add czech and english spellchecking commands
command Spc :set spell spelllang=cz
command Spe :set spell spelllang=en_us
command Spn :set nospell

" highlight incorrectly spelled words
hi SpellBad ctermfg=red
hi SpellBad cterm=underline


" === PLUGINS === "
" vimwiki
let g:vimwiki_list = [{'path': '~/Documents/Wiki/', 'diary_rel_path': 'Diary/', 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_table_mappings = 0  "disable tab mappings in insert mode 
let g:vimwiki_global_ext = 0      " don't use vimwiki format for other md files

" ultisnips
let g:UltiSnipsSnippetsDir=$HOME.'/.vim/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#ale#enabled=1

" ale
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_insert_leave='never'
let g:ale_lint_on_enter='never'
let g:ale_lint_on_filetype_changed='never'

" calendar
let g:calendar_first_day="monday"
