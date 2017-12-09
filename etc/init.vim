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
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'w0rp/ale'
Plug 'vim-python/python-syntax'
Plug 'autowitch/hive.vim'
Plug 'rodjek/vim-puppet'
Plug 'rust-lang/rust.vim'
Plug 'moll/vim-bbye'
Plug 'chr4/nginx.vim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
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
" make space in the command bar for more info
set cmdheight=2
" show folder glyphs
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" show folder open glyph
let g:DevIconsEnableFoldersOpenClose = 1
" shortcut to preview markdown
let vim_markdown_preview_hotkey='<C-m>'
" use chrome for markdown preview
let vim_markdown_preview_browser='Google Chrome'
" Use etf-8 encoding by default
set encoding=utf8

" TABS / SPACES
" tabs are spaces
set expandtab
" number of visual spaces per tab
set tabstop=4
" number of spaces in tab when editing
set softtabstop=4
" number of spaces to use for each indent
set shiftwidth=4
" use shift-tab to unindent
nnoremap <s-tab> <<
inoremap <s-tab> <c-d>
" display newlines
set listchars=tab:▸\ ,eol:¬
set list

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
" use system clipboard
set clipboard=unnamed

" WINDOWS / BUFFERS
" next window
map <c-h> :wincmd<space>W<cr>
" new window
map <c-n> :vertical<space>new<cr>
" close window
map <c-q> :q<cr>
" next buffer
map <c-j> :BuffergatorMruCycleNext<cr>
" list buffers
map <c-b> :BuffergatorToggle<cr>
" close buffer
map <c-w> :Bdelete<cr>
" let buffers be hidden
set hidden
" split new window at bottom
set splitbelow

" jedi config
let g:jedi#completions_enabled = 0
let g:jedi#goto_command = '<c-g>'
let g:jedi#documentation_command = '<c-d>'
let g:jedi#auto_close_doc = 1

" AUTOCOMPLETE
let g:deoplete#enable_at_startup = 1

" python-syntax
let g:python_highlight_all = 1
let g:pymode_python = 'python3'

" javascript
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" for .hql files
au BufNewFile,BufRead *.hql set filetype=hive expandtab

" for .q files
au BufNewFile,BufRead *.q set filetype=hive expandtab

" Use rls for rust linting.
let g:ale_linters = {'rust': ['rls']}

