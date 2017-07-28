call plug#begin()
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'sickill/vim-monokai'
Plug 'vim-airline/vim-airline'
Plug 'sjl/gundo.vim'
"Plug 'davidhalter/jedi-vim'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
"Plug 'vim-syntastic/syntastic'
Plug 'jeetsukumaran/vim-buffergator'
call plug#end()

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

map <C-i> :PlugInstall<cr>
map <C-e> :NERDTreeToggle<cr>
map <C-p> :FZF<cr>
map <C-f> :Ack<space>''<left>

set mouse=a " enable mouse support

" Settings
map , :vsp ~/.config/nvim/init.vim<cr>
map <C-r> :source ~/.config/nvim/init.vim<cr>

" File
map <C-s> :w<CR>

" Windows / Buffers
map <C-j> :wincmd<space>w<CR>
map <C-h> :wincmd<space>W<CR>
map <C-k> :BuffergatorMruCycleNext<CR>
map <C-n> :vsplit<CR>
"unmap <C-w>w
map <C-w> :bp <BAR> bd #<CR>
map <C-q> :q<CR>
"map <C-d> :new<CR>
"map <C-b> :BuffergatorOpen<cr>
"map K <C-w>W

" Buffer
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab

" move to beginning/end of line
map B ^
map E $

" let mapleader = "," " leader is comma
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:ackprg = 'rg --vimgrep --no-heading'

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
