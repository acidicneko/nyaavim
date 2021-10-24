" =============Place your plugins here==================
call plug#begin('~/.local/share/nvim/plugged')

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'ayu-theme/ayu-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'

call plug#end()



" =============Configure your plugins here==============

" NeoTree Config
lua require'nvim-tree'.setup {}

let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '*.o' ]

" Ayu-Dark Colors
set termguicolors
let ayucolor="dark"
colorscheme ayu

" Galaxyline Config
luafile ~/.config/nvim/lua/galaxyline/eviline.lua

" Startify Config

let g:startify_custom_header = startify#center([
										\' _   _                         _',
										\'| \ | |_   _  __ _  __ ___   _(_)_ __ ___',
										\'|  \| | | | |/ _` |/ _` \ \ / / |  _   _  \',
										\'| |\  | |_| | (_| | (_| |\ V /| | | | | | |',
										\'|_| \_|\__, |\__,_|\__,_| \_/ |_|_| |_| |_|',
										\'       |___/'
									\])
