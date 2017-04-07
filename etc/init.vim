call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'sickill/vim-monokai'
Plug 'vim-airline/vim-airline'

call plug#end()

set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line

colorscheme monokai
set lazyredraw

set timeoutlen=1000 ttimeoutlen=0

map ,u :source ~/.config/nvim/init.vim<CR>

let g:airline_powerline_fonts = 1
