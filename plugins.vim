" =============Place your plugins here==================
call plug#begin('~/.local/share/nvim/plugged')

Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'ayu-theme/ayu-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'

call plug#end()



" =============Configure your plugins here==============

" NeoTree Config
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '*.o' ]

" Ayu-Dark Colors
set termguicolors
let ayucolor="dark"
colorscheme ayu

" Galaxyline Config
luafile ~/.config/nvim/lua/galaxyline/eviline.lua

" Startify Config

let g:startify_custom_header = startify#center([
                                        \'            .  &.    .##&@@@@.        ',
                                        \'            *(@#&@(%(#@@@@@@@@@@@@*   ',
                                        \'          #@@#@@@@(#@@&@@@@@@@@@&@@ . ',
                                        \'            &@#@@@@@@@&@@@@@@%#/(@@@@ ',
                                        \'           &@@@@%@@@./@@@@((@((*(((@. ',
                                        \'           ..&@@%%@@%@(&%&((@&@%&(( @.',
                                        \'              @@@&@@@@.*//((@(@((%,.#*',
                                        \'             #@@@@@@@& ./((((((((#    ',
                                        \'              ...(&##((( ((((&#%      ',
                                        \'      @@@*  @  ,/(%(%(((#@&((&        ',
                                        \'   %&@@@@@@#***///#(#(((              ',
                                        \'  .#(#&@&@@@@@@%((/##(@               ',
                                        \'  *#%%&@&@@#%%@@@@@#&#@@              ',
                                        \' @@@%###@&@@&&@@@@@@@@(%@@            ',
                                        \' .@###&&&&@@@@@@@@@@@@@(#((@          ',
                                        \'  ,###@@@@@&&@@@@@@@@@@@((@@@.        ',
                                        \' ..#%#&@@@@@@@@@@@@@@@@@((((#@        ',
                                        \'..,&%#%@@@@@@@@@@@@@@@@@%###%@@       '
                                        \ ])
