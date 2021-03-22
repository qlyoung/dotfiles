"use hard tabs
set noexpandtab
"a tab is 8 columns
set tabstop=8
"reindent and autoindent use 8 columns
set shiftwidth=8
"line numbers on
set number
"change insert timeout
set timeoutlen=50
"autoindent based on file type
filetype plugin indent on
"highlight syntax
syntax on
"allow backspacing over most things
set backspace=indent,eol,start
"disable folding
set nofoldenable

"gd to jump to definition
nmap <silent> gd <Plug>(coc-definition)

"highlight colors
hi Search cterm=NONE ctermfg=white ctermbg=blue

"clang-format
map <C-k> :pyf /usr/local/bin/clang-format.py<CR>
imap <C-k> <c-o> :pyf /usr/local/bin/clang-format.py<CR>
let g:clang_format_path='/usr/bin/clang-format'

"airline
let g:airline_powerline_fonts=1
let g:airline_theme='base16'
"spaces are allowed after tabs, but not in between
let g:airline#extensions#whitespace#mixed_indent_algo=2
set laststatus=2

"generate RST-compatible tables
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

"misc
command RemoveTrailingWhitespace %s/\s\+$//
"automatically remove trailing whitespace on :w
"autocmd BufWrite * :call RemoveTrailingWhitespace()

"plugins
call plug#begin()
Plug 'dhruvasagar/vim-table-mode'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
" Plug 'oblitum/YouCompleteMe'
Plug 'ambv/black'
Plug 'universal-ctags/ctags'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hiphish/jinja.vim'
Plug 'nathanalderson/yang.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'nathanalderson/yang'
Plug 'zah/nim.vim'
call plug#end()

"set color scheme
"colorscheme sourcerer
colorscheme nord
