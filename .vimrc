call plug#begin('~/.vim/plugged')
"Plug 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"" Colorscheme
Plug 'phanviet/vim-monokai-pro'
Plug 'Yavor-Ivanov/airline-monokai-subtle.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nanotech/jellybeans.vim'
Plug 'sheerun/vim-polyglot'
"Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --tern-completer'  }
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'honza/vim-snippets'
Plug 'pgavlin/pulumi.vim'
Plug 'chr4/nginx.vim'
"Plug 'psf/black', { 'branch': 'stable' }
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wakatime/vim-wakatime'
"Plug 'easymotion/vim-easymotion'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

let python_highlight_all=1
syntax on
filetype plugin on
filetype plugin indent on
let g:isort_command = 'isort'
"colorscheme pulumi
set number
set expandtab
set tabstop=4
set shell=/usr/local/bin/zsh
set enc=utf-8
set termguicolors
set background=dark
" Colors config
set termguicolors
colorscheme monokai_pro
let g:airline_theme = 'monokai_subtle'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:monokai_pro_italic=1
let g:monokai_pro_subtle_spell=1
let g:monokai_pro_subtle_airline=1

" Курсор в виде блока для всех режимов
set guicursor=n-v-c:block-Cursor

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

set hlsearch
set incsearch

" All mappings
" Run NERDTree
map <C-n> :NERDTreeToggle<CR>
" WinMove
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>
" Disable key left, right, up, down

let g:pymode_run_bind='<F5>'
imap <F5> <Esc>:w<CR>:!clear;python %<CR>

" Function for Window Move
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

" Enable Backspace
set backspace=indent,eol,start
set ruler

let g:ycm_confirm_extra_conf = 0

