if has('nvim')
    tnoremap <Esc> <C-\><C-n>
else
    set nocompatible
    filetype plugin indent on
    set t_Co=256
    set mouse=a
    set ttymouse=xterm2
endif

call plug#begin()

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
map <F7> :NERDTreeToggle<CR>

Plug 'tomasr/molokai'

Plug 'bling/vim-airline'
set laststatus=2
let g:airline_left_sep=' '
let g:airline_right_sep=' '

Plug 'christoomey/vim-tmux-navigator'
inoremap <silent> <C-h> <c-o>:TmuxNavigateLeft<cr>
inoremap <silent> <C-j> <c-o>:TmuxNavigateDown<cr>
inoremap <silent> <C-k> <c-o>:TmuxNavigateUp<cr>
inoremap <silent> <C-l> <c-o>:TmuxNavigateRight<cr>

Plug 'tpope/vim-fugitive'

Plug 'mrk21/yaml-vim', { 'for': 'yaml' }

Plug 'Chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR>


call plug#end()


colorscheme molokai
set fillchars-=vert:\| | set fillchars+=vert:\ 
set number
set expandtab softtabstop=4 shiftwidth=4
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
set timeoutlen=100 ttimeoutlen=0

