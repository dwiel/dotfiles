set nu
set expandtab
set ts=4
set shiftwidth=4
set hls
set modeline
set ruler
set nofoldenable    " disable folding
let mapleader = ","
set incsearch       " incremental search as you type

au FileType python setlocal formatprg=autopep8\ -

" nu adds line numbers to :E mode.  The rest are the defaults that need
" preserved
let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl'

" auto wrap python comments at 72 chars
set formatoptions=cq textwidth=72 foldignore= wildignore+=*.py[co]

syntax on
filetype plugin indent on

" try
    call pathogen#infect()
    call pathogen#helptags()

    call plug#begin('~/.vim/plugged')

    Plug 'klen/python-mode', { 'for': ['python'] }
    Plug 'https://github.com/JarrodCTaylor/vim-python-test-runner'
    Plug 'https://github.com/ervandew/supertab.git'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'mindriot101/vim-yapf'
    Plug 'https://github.com/tpope/vim-commentary.git'

    call plug#end()

    let g:pymode_lint_ignore = "E501,W"
    " let g:pymode_lint_checkers = ["xyz"] 
    let g:pymode_rope_goto_definition_bind = "<C-]>"
    let g:pymode_rope_autoimport_bind = '<C-c>rai'
    " let g:pymode_lint_on_write = 0
    " let g:pymode_lint_unmodified = 0
    let g:pymode_rope_project_root = "~/private-ngraph"
    " let g:pymode = 0

    nnoremap <Leader>nf :NosetestFile<CR>
    nnoremap <Leader>nc :NosetestClass<CR>
    nnoremap <Leader>nm :NosetestMethod<CR>
    nnoremap <Leader>nb :NosetestBaseMethod<CR>
    nnoremap <Leader>rr :RerunLastTests<CR>

    " <leader>y runs yapf on entire file
    " this version changes the position of the cursor after running yapf
    " which is jarring, while the plugin does not have this problem
    " autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>
    :nnoremap <leader>y :Yapf<cr>

    map <F4> :e %:p:s,.hpp$,.X123X,:s,.cpp$,.hpp,:s,.X123X$,.cpp,<CR>

    " syntasitc defines :Errors command which means :E is now ambiguous
    command E Ex
" catch
" endtry

