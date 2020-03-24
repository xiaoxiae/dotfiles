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

set list!
set listchars=tab:>-,trail:~

" === TABS === "
set tabstop=4 shiftwidth=4  " tab is 4 characters wide
set autoindent smartindent  " smart indenting f jdaiof jadsiof jiadsfjioads jj
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

set autoread  " automatically read files when reloaded outide Vim

set autochdir " automatically change directory to current file


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

" more natural splitting
set splitbelow splitright

" enable mouse options
set mouse=a

" automatic split resize
autocmd VimResized * wincmd =


" === BUFFER BINDINGS === "
" bind shift + h/l buttons to move between buffers
nnoremap H :bnext<CR>
nnoremap L :bprevious<CR>


" === CUSTOM COMMANDS === "
autocmd FileType python  map <F2> :w \| !py %<cr>

autocmd FileType arduino map <F2> :w \| !arduino-cli compile --fqbn arduino:avr:uno .<cr>
autocmd FileType arduino map <F3> :w \| !arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno .<cr>

autocmd FileType c       map <F2> :w \| !gcc % -o %:r && ./%:r<cr>
autocmd FileType cpp     map <F3> :w \| !gcc % -o %:r<cr>

autocmd FileType vimwiki map <F2> :w \| !md_to_pdf -f="%" -t=h; if test -e %:r.pdf; zathura %:r.pdf; end<cr>
autocmd FileType vimwiki map <F3> :w \| !md_to_pdf -f="%" -t=h<cr>

" makes more sense to separate the compile and the bib stuff
autocmd FileType tex     map <F3> :w \| !lualatex -shell-escape "%"<cr>
autocmd FileType tex     map <F4> :w \| !bibtex "%:r"<cr>

autocmd FileType sh      map <F2> :w \| !./%<cr>

autocmd FileType cpp     map <F2> :w \| !g++ % -o %:r && ./%:r<cr>
autocmd FileType cpp     map <F3> :w \| !g++ % -o %:r<cr>

autocmd FileType cs      map <F2> :w \| !mcs % && mono %:r.exe<cr>


" === FILETYPE-SPECIFIC BEHAVIOR === "
" decrease indentation in Tex documents
autocmd FileType tex  setlocal tabstop=2 shiftwidth=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType vimwiki  setlocal wrap
autocmd FileType markdown setlocal ft=vimwiki

" Python spell check and auto format
autocmd FileType python  execute ':Spe'
autocmd BufWritePre *.py execute ':Black'

" unify tex flavors, since I really only work with LaTeX
let g:tex_flavor = "latex"


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

" highlight incorrectly spelled words (due to Badwolf being bad)
hi SpellBad ctermfg=red
hi SpellBad cterm=underline

" === PLUGINS === "
" vimwiki
let g:vimwiki_list = [{'path': '~/Documents/Wiki/', 'diary_rel_path': 'Diary/', 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_table_mappings = 0  " disable tab mappings in insert mode 
let g:vimwiki_global_ext = 0      " don't use vimwiki format for other md files
let g:vimwiki_conceallevel = 0    " disable conceal level

" ultisnips
let g:UltiSnipsSnippetsDir=$HOME.'/.vim/UltiSnips/'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ale
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_insert_leave='never'
let g:ale_lint_on_enter='never'
let g:ale_lint_on_filetype_changed='never'

set conceallevel=0
