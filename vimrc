" ~/.vimrc — Vim configuration

" ── General ──────────────────────────────────────────────────────────────────
set nocompatible          " use Vim defaults, not Vi
set encoding=utf-8
set fileencoding=utf-8
set history=1000
set undolevels=1000

" ── UI ───────────────────────────────────────────────────────────────────────
set number                " show line numbers
set relativenumber        " relative line numbers
set cursorline            " highlight current line
set showmatch             " highlight matching brackets
set scrolloff=5           " keep 5 lines visible above/below cursor
set laststatus=2          " always show status line
set ruler                 " show cursor position
set showcmd               " show incomplete commands
set wildmenu              " enhanced command-line completion
set visualbell            " no beeping

" ── Whitespace ───────────────────────────────────────────────────────────────
set expandtab             " use spaces instead of tabs
set tabstop=2             " visual tab width
set shiftwidth=2          " indent width
set softtabstop=2
set autoindent
set smartindent
set list                  " show invisible characters
set listchars=tab:▸\ ,trail:·

" ── Search ───────────────────────────────────────────────────────────────────
set incsearch             " incremental search
set hlsearch              " highlight search results
set ignorecase            " case-insensitive search …
set smartcase             " … unless the query has uppercase letters
" Clear search highlight with <Esc>
nnoremap <Esc> :nohlsearch<CR>

" ── Files ────────────────────────────────────────────────────────────────────
set autoread              " reload files changed outside Vim
set nobackup
set nowritebackup
set noswapfile

" ── Syntax / colours ─────────────────────────────────────────────────────────
syntax enable
if has('termguicolors')
  set termguicolors
endif
set background=dark

" ── Key mappings ─────────────────────────────────────────────────────────────
let mapleader = ','

" Navigate splits with Ctrl+hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Quick save / quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" ── Local overrides ───────────────────────────────────────────────────────────
" Machine-specific settings that should NOT be committed to the repo
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
