let mapleader = " "

call plug#begin('~/.vim/plugged')

if has("nvim")

    " telescope dependencies
    Plug 'nvim-lua/plenary.nvim'
    Plug 'BurntSushi/ripgrep'
    Plug 'sharkdp/fd'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-treesitter/nvim-treesitter-context'
    Plug 'nvim-telescope/telescope.nvim'

    " snippets
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'rafamadriz/friendly-snippets'

    " completion magic
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/nvim-cmp'

    Plug 'windwp/nvim-autopairs'

endif

Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'puremourning/vimspector'
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

augroup trim_dangling_whitespace
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

nnoremap <C-l> <cmd>bnext<CR>
nnoremap <C-h> <cmd>bprev<CR>
nnoremap <C-j> <cmd>cnext<CR>
nnoremap <C-k> <cmd>cprev<CR>

if has("nvim")
else
    function! SuperCleverTab()
        if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
            return "\<Tab>"
        elseif pumvisible()
            return "\<c-n>"
        else
            if &omnifunc != ''
                return "\<C-X>\<C-O>"
            elseif &dictionary != ''
                return "\<C-K>"
            else
                return "\<C-N>"
            endif
        endif
    endfunction

    inoremap <Tab> <C-R>=SuperCleverTab()<cr>
endif


" Make Y yank to end of line like D or C
nnoremap Y y$

" Keep search and J centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Keep paging movements centered
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz

" Set new undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" add big relative moves to the jump list
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'

" move lines of text without copy/paste
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==i
inoremap <C-k> <esc>:m .-2<CR>==i
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

nnoremap <leader>ls <CMD>Ex<CR>
