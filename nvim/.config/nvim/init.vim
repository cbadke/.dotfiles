let mapleader = " "


call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
" neovim lsp
" fugitive
Plug 'tpope/vim-fugitive'
" undotree
call plug#end()

colorscheme gruvbox
set background=dark
highlight Normal guibg=none

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup cbad
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
