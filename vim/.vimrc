set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

"call vundle#rc()
call vundle#begin()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'VundleVim/Vundle.vim'

Plugin 'The-NERD-tree'
map <F7> :NERDTreeToggle<CR>
"Plugin 'jistr/vim-nerdtree-tabs'
"let g:nerdtree_tabs_open_on_console_startup=1
"map nt :NERDTreeTabsToggle<CR>

Plugin 'tomasr/molokai'

Plugin 'bling/vim-airline'
set laststatus=2
"let g:airline_powerline_fonts = 1
let g:airline_left_sep=' '
let g:airline_right_sep=' '

Plugin 'ctrlp.vim'
let g:ctrlp_cmd = 'CtrlPBuffer'

Plugin 'fatih/vim-go'

Plugin 'Shougo/neocomplete'

Plugin 'cmdalias.vim'
autocmd VimEnter * Alias gr GoRun
autocmd VimEnter * Alias gt GoTest

Plugin 'peterhoeg/vim-qml'

Plugin 'Tagbar'
nmap <F8> :TagbarToggle<CR>

Plugin 'christoomey/vim-tmux-navigator'
"let g:tmux_navigator_no_mappings = 1
"nnoremap <silent> <C-Left> :TmuxNavigateLeft<cr>
"nnoremap <silent> <C-Down> :TmuxNavigateDown<cr>
"nnoremap <silent> <C-Up> :TmuxNavigateUp<cr>
"nnoremap <silent> <C-Right> :TmuxNavigateRight<cr>
"noremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
inoremap <silent> <C-h> <c-o>:TmuxNavigateLeft<cr>
inoremap <silent> <C-j> <c-o>:TmuxNavigateDown<cr>
inoremap <silent> <C-k> <c-o>:TmuxNavigateUp<cr>
inoremap <silent> <C-l> <c-o>:TmuxNavigateRight<cr>

Plugin 'DirDiff.vim'

Plugin 'Chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR>

Plugin 'mrk21/yaml-vim'

Plugin 'tpope/vim-fugitive'

call vundle#end()


filetype plugin indent on
set t_Co=256
colorscheme molokai
set mouse=a
set ttymouse=xterm2
set fillchars-=vert:\| | set fillchars+=vert:\
set number
set expandtab softtabstop=4 shiftwidth=4
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
set timeoutlen=100 ttimeoutlen=0
imap <C-Space> <C-X><C-O>
