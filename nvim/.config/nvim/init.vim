let mapleader = " "

call plug#begin('~/.vim/plugged')

if has("nvim")
    Plug 'nvim-lua/plenary.nvim'
    Plug 'BurntSushi/ripgrep'
    Plug 'sharkdp/fd'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-telescope/telescope.nvim'

    Plug 'neovim/nvim-lspconfig'
endif

Plug 'gruvbox-community/gruvbox'
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

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup cbad
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

nnoremap gl <cmd>bnext<CR>
nnoremap gh <cmd>bnext<CR>
