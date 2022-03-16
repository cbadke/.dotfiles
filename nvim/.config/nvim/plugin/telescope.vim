if has("nvim")
    nnoremap <C-p> <cmd>Telescope git_files theme=dropdown<CR>
    nnoremap <leader>fg <cmd>Telescope live_grep theme=dropdown<CR>
    nnoremap <leader>ff <cmd>Telescope find_files theme=dropdown<CR>
    nnoremap <leader>fb <cmd>Telescope buffers theme=dropdown<CR>
    nnoremap <leader>man <cmd>Telescope man_pages<CR>
endif
