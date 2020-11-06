call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'yuttie/comfortable-motion.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mattn/vim-gist'
Plug 'mattn/webapi-vim'
call plug#end()

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set ttyfast                     " Indicate fast terminal conn for faster redraw
set ttymouse=xterm2             " Indicate terminal type for mouse codes
set ttyscroll=3                 " Speedup scrolling
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " Enabile Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw
set relativenumber
set visualbell                  "disalbe bell in vim"
set clipboard=unnamedplus       " Win copy paste
set bg=dark

if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

" NERD Tree Settings
let NERDTreeShowHidden=1
let g:NERDTreeWinSize = 40
" Ignore C# build folders
let NERDTreeIgnore=['bin$[[dir]]', 'obj$[[dir]]', '\.vs$[[dir]]', '\~$']

" Colorscheme
autocmd vimenter * colorscheme gruvbox
syntax enable

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
""""""""""""""""""""""
"      Mappings      "
""""""""""""""""""""""
" Your own mappings
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
""""""""""""""""""""""
" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ","

" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Act like D and C
nnoremap Y y$

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

" Auto enclosing brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""

"omnisharp stuff
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>d :OmniSharpDocumentation<CR>
nnoremap <leader>fu :OmniSharpFindUsages<CR>
nnoremap <leader>gd :OmniSharpGotoDefinition<CR>
nnoremap <leader>pd :OmniSharpPreviewDefinition<CR>
nnoremap <leader>rr :!dotnet run

".net
let g:OmniSharp_want_snippet=1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_selector_ui = 'ctrlp'
let g:ale_linters = { 'cs': ['OmniSharp'] }
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'cs': ['uncrustify'] }
let g:ale_fix_on_save = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_list_window_size = 5
