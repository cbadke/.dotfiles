if has("nvim")
    nnoremap <C-p> <cmd>Telescope git_files theme=dropdown<CR>
    nnoremap <leader>sg <cmd>Telescope live_grep theme=dropdown<CR>
    nnoremap <leader>sf <cmd>Telescope find_files theme=dropdown<CR>
    nnoremap <leader>sb <cmd>Telescope buffers theme=dropdown<CR>
    nnoremap <leader>man <cmd>Telescope man_pages<CR>
endif
