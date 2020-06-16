call plug#begin('~/.vim/plugged')
" files
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdtree'

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" tmux
Plug 'christoomey/vim-tmux-navigator'

" theme
Plug 'rakr/vim-one'
Plug 'drewtempelmeyer/palenight.vim'

" XML
Plug 'gregsexton/MatchTag', {'for': ['xml', 'html']}
Plug 'tpope/vim-ragtag', {'for': ['xml', 'html']}

"git
Plug 'airblade/vim-gitgutter'

" tags
Plug 'majutsushi/tagbar'

" python
" The indent that comes with polyglot is slow, so use the faster but older one
Plug 'vim-scripts/indentpython.vim', {'for': 'python'}
Plug 'w0rp/ale', {'for': 'python'}

" misc
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'

call plug#end()

" GENERAL
set term=xterm
let mapleader=","
imap jj <Esc>
set mouse=a
" reopen file at last edit location
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
set guicursor=
set spelllang=en
set nohlsearch
set backspace=indent,eol,start

" intendation
set expandtab		    "expands tabs to spaces
set tabstop=4			"Width of tab set to 4
set softtabstop=4		"set the number of cols for a tab
set shiftwidth=4		"indents will have width of 4
set autoindent

"set cursorline
set number
set ruler

" line at 80 chars
set colorcolumn=80
"Set highlight colors
hi MatchParen cterm=none ctermbg=66 ctermfg=251
"menu
set wildmenu
set wildmode=longest:full,full

"COLORS
set termguicolors
syntax enable
set background=dark
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" Set colortheme, but don't warn on start up if can't find it
"silent! colorscheme palenight
"silent! let g:airline_theme="palenight"
silent! colorscheme one
silent! let g:airline_theme="one"

" CLIPBOARD - this doesn't require +clipboard and uses xclip instead
" copy highlighted selection only does complete lines
vnoremap <leader>y :w !xclip -i -selection clipboard<CR><CR>

"COMMANDS
function! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
    let @/=_s
endfun
command StripTrailing :call <SID>StripTrailingWhitespaces()
" auto strip py files on save
autocmd BufWritePre *.py,*.yml,*.json :call <SID>StripTrailingWhitespaces()
" break a line and auto indent
command BreakLine :s/, /,\r/g

" SHORTCUTS
" remap switching panes to ctrl+directions
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" next/previous buffer
map <leader>[ :bp<CR>
map <leader>] :bn<CR>
map <F3> :bp<CR>
map <F4> :bn<CR>

" MACROS
" insert python pudb breakpoint
let @b='Iimport pudb; pu.dbjj'

"PLUGINS
"ctrlp ctrl-t for symbol search
nnoremap <C-t> :CtrlPBufTag<CR>

"nerdtree
nnoremap <silent><leader>n :NERDTreeToggleVCS<CR>
let g:NERDTreeQuitOnOpen = 1

"nerdcommenter
nmap <C-_> <leader>c<Space>
vmap <C-_> <leader>c<Space>

" disable slow pep8 indent python script (use indentpython instead)
let g:polyglot_disabled = ["python-indent"]

" python syntax settings see https://github.com/vim-python/python-syntax
let g:python_highlight_all = 1
let g:python_highlight_class_vars = 0
let g:python_highlight_builtins = 0

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_type = 0
set laststatus=2
set ttimeoutlen=10

" tagbar settings
nnoremap <silent><leader>t :TagbarToggle<CR>
let g:tagbar_autoclose = 1
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_singleclick = 1
let g:tagbar_sort = 0
highlight TagbarHighlight ctermfg=Black ctermbg=Blue

" ale
nnoremap <silent><leader>e :ALENextWrap<CR>
nnoremap <silent><leader>E :ALEPreviousWrap<CR>
nnoremap <leader>f :ALEFix<CR>
let g:ale_linters={'python':['flake8']}
let g:ale_python_flake8_options = "--max-line-length 88"
let g:ale_fixers={'python':['isort', 'yapf']}
