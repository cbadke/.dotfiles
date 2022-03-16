set exrc
set guicursor=

set relativenumber
set number

set nohlsearch

set hidden
set noerrorbells

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set nowrap

set noswapfile
set nobackup

if has("nvim")
    set undodir=~/.local/share/nvim/undodir
else
    set undodir=~/.vim/undodir
endif
set undofile

set incsearch
set termguicolors
set scrolloff=8

set colorcolumn=80
set signcolumn=yes

set completeopt=menuone,noinsert,noselect
set updatetime=50

set list
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen
