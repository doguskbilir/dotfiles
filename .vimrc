" ~/.vimrc

set nocompatible

" Turn on syntax highlighting.
syntax on

" File type detection
filetype plugin on
filetype indent on

" Disable the default Vim startup message.
set shortmess+=I

" Disable folding
set nofoldenable

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" Set the option to automatically convert tabs into spaces
set expandtab

" Set the number of spaces that a tab character equals
set tabstop=4

" Enable automatic indentation
set autoindent

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Enable syntax highlighting for Markdown files
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Enable syntax highlighting for Python files
autocmd BufNewFile,BufRead *.py set filetype=python

" shiftwidth sets the number of spaces to use for each step of (auto)indenting.
" This is separate from tabstop because you might want to use a different number
" of spaces for indenting than you do for tabs.
set shiftwidth=4

" softtabstop sets the number of spaces that a <Tab> in insert mode inserts.
" This is separate from tabstop because you might want to use a different number
" of spaces for tabs than you do for <Tab>s.
set softtabstop=4

" Ensure that Vim is using 256 colors
if $COLORTERM == 'truecolor' || $COLORTERM == '24bit'
    set termguicolors
else
    set t_Co=256
endif


" Specify a directory for plugins (e.g., ~/.vim/plugged)
call plug#begin('~/.vim/plugged')

" List of plugins
" Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
Plug 'cocopon/iceberg.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'cormacrelf/vim-colors-github'
Plug 'rakr/vim-one'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ALE for linting and autocompletion support
Plug 'dense-analysis/ale'

" Sensible default settings for Vim
Plug 'tpope/vim-sensible'

" Markdown plugins
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

" Initialize plugin system
call plug#end()

" Light theme
colorscheme github

" Dark theme
colorscheme dracula

" Color scheme for vimdiff
if &diff
    colorscheme desert
endif

" ALE configuration
let g:ale_linters = {
\   'python': ['flake8'],
\   'sh': ['shellcheck'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'sh': ['shfmt'],
\}
let g:ale_python_flake8_executable = 'flake8'
let g:ale_python_flake8_options = '--max-line-length=88'

" coc.nvim configuration
let g:coc_global_extensions = ['coc-pyright', 'coc-sh']

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <CR> to confirm selection and close popup menu
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Toggle between dark and light themes
nnoremap <F5> :set background=dark<CR>:colorscheme dracula<CR>
nnoremap <F6> :set background=light<CR>:colorscheme github<CR>

"EOF
