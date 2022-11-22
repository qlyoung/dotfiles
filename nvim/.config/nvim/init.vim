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
hi Search cterm=none ctermfg=white ctermbg=blue

"clang-format
map <C-k> :py3f /usr/share/clang/clang-format.py<CR>
imap <C-k> <c-o> :py3f /usr/share/clang/clang-format.py<CR>
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

"disable ALE lsp server
let g:ale_disable_lsp = 1

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
silent Plug 'ambv/black'
Plug 'universal-ctags/ctags'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hiphish/jinja.vim'
Plug 'nathanalderson/yang.vim'
Plug 'zah/nim.vim'
Plug 'savq/melange'
Plug 'dense-analysis/ale'
call plug#end()

if exists('$TMUX')
    " Colors in tmux
    let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif

"set color scheme
"colorscheme sourcerer
set background=dark
set termguicolors
colorscheme melange
