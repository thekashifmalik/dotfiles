call plug#begin()

Plug 'sickill/vim-monokai'
Plug 'scrooloose/nerdtree'

call plug#end()

set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line

colorscheme monokai
set lazyredraw

set timeoutlen=1000 ttimeoutlen=0
