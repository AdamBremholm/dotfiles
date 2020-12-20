syntax on
filetype plugin indent on

set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set noshowmode
set clipboard+=unnamedplus
set cmdheight=2
set formatprg=prettier

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin('~/.vim/plugged')

"neovim lsp plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

"other plugins
Plug 'gruvbox-community/gruvbox'

call plug#end()

" Themes
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark

let mapleader = " "


"native file explorer
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir='rm -r'

" Use <C-j> and <C-k> to navigate through popup menu of completion-nvim
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.omnisharp.setup{ on_attach=require'completion'.on_attach }

lua require'nvim-treesitter.configs'.setup {highlight = {enable = true}}


"lsp bindings
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap <F2> :lua vim.lsp.buf.rename()<CR>
nnoremap gh :lua vim.lsp.buf.hover()<CR>
nnoremap gca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>gda :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>

"other remaps
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" greatest remap ever
vnoremap <leader>p "_dP
