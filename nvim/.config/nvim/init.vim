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
"set color scheme
colorscheme sourcerer

"highlight colors
hi Search cterm=NONE ctermfg=white ctermbg=blue

"clang-format
map <C-k> :pyf /usr/local/bin/clang-format.py<cr>
imap <C-k> <c-o>:pyf /usr/local/bin/clang-format.py<cr>
let g:clang_format_path='clang-format-5.0'

"YCM
set completeopt-=preview

"airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
set laststatus=2

"misc
command RemoveTrailingWhitespace %s/\s\+$//
"automatically remove trailing whitespace on :w
"autocmd BufWrite * :call RemoveTrailingWhitespace()

"plugins
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'oblitum/YouCompleteMe'
call plug#end()

