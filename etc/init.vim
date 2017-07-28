" PLUGINS
call plug#begin()
Plug 'sickill/vim-monokai'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'vim-airline/vim-airline'
call plug#end()
" install plugins
map <c-i> :PlugInstall<cr>
" open plugin window at bottom
let g:plug_window = "botright new"

" APPEARANCE
" use the best color theme
colorscheme monokai
" use 24-bit color
set termguicolors
" better performance
set lazyredraw
" show line numbers
set number
" make lines numbers relative
set relativenumber
" highlight current line
set cursorline
" enable sexy font
let g:airline_powerline_fonts = 1
" enable tab line
let g:airline#extensions#tabline#enabled = 1

" TABS / SPACES
" tabs are spaces
set expandtab
" number of visual spaces per tab
set tabstop=4
" number of spaces in tab when editing
set softtabstop=4
" number of spaces to use for each indent
set shiftwidth=4

" NAVIGATION
" enable mouse support
set mouse=a
" visual navigation
map j gj
map k gk
" scroll page
map J jzz
map K kzz
" start / end of line
map H ^
map L $

" FILE EXPLORER
map <c-e> :NERDTreeToggle<cr>
" open file explorer when pointed to a dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" close vim if file explorer is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" show hidden files
let NERDTreeShowHidden=1

" SEARCH
" ignore case in search pattern
set ignorecase
" override ignorecase when search contains uppeercase characters
set smartcase
" use fzf for fuzzy file search
map <c-p> :FZF<cr>
" use ag for text search
map <c-f> :Ack<space>''<left>
let g:ackprg = 'rg --vimgrep --no-heading'

" GIT
" turn off git built-in shortcuts
let g:gitgutter_map_keys = 0
" navigate git hunks
nmap ]g <Plug>GitGutterNextHunk
nmap [g <Plug>GitGutterPrevHunk

" SETTINGS
" open settings file
map , :edit ~/.config/nvim/init.vim<cr>
" reload settings
map <c-r> :source ~/.config/nvim/init.vim<cr>

" EDITING
" redo
map U :redo<cr>
" save
map <c-s> :w<cr>
" disable swapfiles
set noswapfile

" WINDOWS / BUFFERS
" next window
map <c-j> :wincmd<space>w<cr>
" previous window
map <c-h> :wincmd<space>W<cr>
" new window horizontal
map <c-n> :new<cr>
" new window vertical
map <C-m> :vertical new<cr>
" close window
map <C-q> :q<CR>
" next buffer
map <c-k> :BuffergatorMruCycleNext<cr>
" list buffers
map <C-b> :BuffergatorOpen<cr>
" close buffer
map <C-w> :bp <BAR> bd #<CR>

