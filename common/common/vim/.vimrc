" Vim configurations

" Spaces on tab
set expandtab
set tabstop=2
set softtabstop=0
set shiftwidth=2
set smarttab

" Show line numbers and relative numbers
set number
set relativenumber

" Show current position
set ruler

" Ignore case for search
set ignorecase

" Highlight search results
set hlsearch

" Show matching brackets upon cursor focus
set showmatch

" Syntax highlighting
syntax enable

" Line wrap
set wrap
set linebreak
set nolist

" Highlight 81st column to advise against line length > 80
set colorcolumn=81
highlight ColorColumn ctermbg=0 guibg=lightgrey
