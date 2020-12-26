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
set signcolumn=yes
set statusline+=%F

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey


call plug#begin('~/.vim/plugged')

"neovim lsp plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 


"telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"other
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

Plug 'jremmen/vim-ripgrep'
Plug 'gruvbox-community/gruvbox'
Plug 'szw/vim-maximizer'
Plug 'vuciv/vim-bujo'

"visual"
 

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
let g:completion_enable_auto_hover = 0

lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }

"disable virtual text for diagnostics in c#
lua << EOF
require'lspconfig'.omnisharp.setup { 
on_attach=require'completion'.on_attach,
 handlers = { 
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    })
    }
}
EOF

lua require'lspconfig'.sumneko_lua.setup{ on_attach=require'completion'.on_attach}
lua require'lspconfig'.jsonls.setup{ on_attach=require'completion'.on_attach}
lua require'nvim-treesitter.configs'.setup {highlight = {enable = true}}

lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})

"lsp bindings
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gf :lua vim.lsp.buf.formatting()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap gsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap <F2> :lua vim.lsp.buf.rename()<CR>
nnoremap gh :lua vim.lsp.buf.hover()<CR>
nnoremap gca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>gda :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>fs :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>

"telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"git
nnoremap <leader>gb :GBranches<CR>

" vim TODO
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

"terminal easy close"
:tnoremap <Esc> <C-\><C-n>

" Auto enclosing brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

"other remaps
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>m :MaximizerToggle!<CR>

nnoremap n nzzzv
nnoremap N Nzzzv
vnoremap <leader>p "_dP
vnoremap <leader>d "_d
nnoremap <leader>d "_d
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap Y y$
