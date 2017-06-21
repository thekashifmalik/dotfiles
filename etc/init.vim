call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'sickill/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'sjl/gundo.vim'
Plug 'davidhalter/jedi-vim'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'vim-syntastic/syntastic'
call plug#end()

set rtp+=/usr/local/opt/fzf

set number " show line numbers
set relativenumber " make lines numbers relative
set showcmd " show command in bottom bar
set cursorline " highlight current line

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

set hidden
set wildmenu
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

set shiftwidth=4
set softtabstop=4
set expandtab

syntax on " Enable syntax highlighting
colorscheme monokai
set lazyredraw

set timeoutlen=1000
set ttimeoutlen=0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

map <leader>r :source ~/.config/nvim/init.vim<cr>
map <leader>e :vsp ~/.config/nvim/init.vim<cr>
map <leader>t :NERDTree<cr>
map <leader>tt :NERDTreeFind<cr>
map <leader>T :TagbarToggle<cr>
map <leader>u :GundoToggle<cr>
map <leader>p :PlugInstall<cr>
map <leader>f :FZF<cr>
map <leader>F :Ack<space>''<left>
map <leader>c :Commits<cr>
map <leader>ga :Gwrite<cr>
map <leader>gr :Gread<cr>
map <leader>gc :Gcommit<cr>
nnoremap <leader>b :CtrlSpace O<CR>


" move to beginning/end of line
map B ^
map E $

let mapleader = "," " leader is comma
let g:airline_powerline_fonts = 1
let g:ctrlp_show_hidden = 1
let g:ackprg = 'rg --vimgrep --no-heading'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
