filetype on
"filetype indent plugin on
filetype plugin on
set modeline  
set ignorecase
set smartcase
set list

"Command-T should ignore some file types
set wildignore=*.beam,*.sql

"Visual options
set lcs=tab:>-,trail:@
set tabstop=4
set shiftwidth=4
set cursorline
set statusline=%F

"Python specific options
autocmd Filetype python setlocal noexpandtab tabstop=4 softtabstop=4

"Line length guide
set colorcolumn=80,100
highlight ColorColumn ctermbg=lightgrey

set splitright
" https://github.com/scrooloose/syntastic
let g:syntastic_sh_checkers=['shellcheck']
let g:syntastic_python_checkers=['gamlint']
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=0
let g:syntastic_check_on_wq=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_highlighting=1
execute pathogen#infect()
set tags=./tags,tags;$HOME
set runtimepath^=~/.vim/bundle/ctrlp.vim
set number
let mapleader = ","

"Disable arrow keys for good practice
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"split windows easily
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>d <C-w>s<C-w>j

"Shortcuts to move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"These seem more intuitive and don't clash with my tmux"
"page up/down
nnoremap <C-e> <C-u>
"nnoremap <C-d> <C-d>
"frame up/down
nnoremap <C-h> <C-e>
"nnoremap <C-y> <C-y>

"I'm certain that these could be clearer with functions but I don't know how :(
"extract an inline tuple or list from a function call
nnoremap <leader>{ ca{new_variable_placeholder<Esc>O<Tab>new_variable_placeholder<Space>=<Space><Esc>p:.,+1s/new_variable_placeholder//<Left>
nnoremap <leader>[ ca[new_variable_placeholder<Esc>O<Tab>new_variable_placeholder<Space>=<Space><Esc>p:.,+1s/new_variable_placeholder//<Left>
"Extract an inline function call being used as an argument, with two caveats:
"you must be at the start of the function name, and it must not have an inline
"function call itself!
nnoremap <leader>e cf)new_variable_placeholder<Esc>O<Tab>new_variable_placeholder<Space>=<Space><Esc>p:.,+1s/new_variable_placeholder//<Left>

"TODO write a similar thing to extract a function

"Make up and down work over linewraps.
nnoremap j gj
nnoremap k gk

set showcmd

"open terminal below (neovim only)
nnoremap <leader>t :below 22sp term://$SHELL<cr>i
set clipboard+=unnamedplus
if has('nvim')
    tnoremap <C-[> <C-\><C-n>
endif


"Easier moving to start/end line
nnoremap <leader>f ^
nnoremap <leader>g $

map <leader>l <Esc>oerror_logger:warning_msg(),<Left><Left>

nnoremap <C-n> :set relativenumber!<cr>
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
:au FocusLost * :set number
:au FocusGained * :set relativenumber

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
