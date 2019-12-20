set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'neomake/neomake'
Plugin 'tpope/vim-commentary'
Plugin 'storyn26383/vim-vue'
Plugin 'tpope/vim-surround'
Plugin 'mhinz/vim-signify'
Plugin 'adelarsq/vim-matchit'
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'   " snipmate's dependencie
Plugin 'tomtom/tlib_vim'                " snipmate's dependencie
Plugin 'honza/vim-snippets'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ap/vim-css-color'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use: filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

syntax enable
colorscheme hybrid_material
let g:enable_italic_font = 1
set encoding=utf8
set t_Co=256
set cursorline
set tabstop=4
set expandtab
set shiftwidth=4
set autochdir
set autoindent
set pastetoggle=<Leader>p
set number relativenumber " hybrid line numbers, set nu rnu
set wildmenu " Command-line completion
highlight CursorLineNr ctermfg=215
highlight LineNr ctermfg=250
let loaded_matchparen=1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='simple'
set noshowmode

" Show extra space and tab
set listchars=tab:▷⋅,trail:·
set list
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Delete extra space and tab on current line
nmap ed :s#\s\+$##<CR>

" Search
set hlsearch
set smartcase
set ignorecase
set incsearch
highlight Search ctermbg=Yellow
highlight Search ctermfg=Blue

inoremap <C-d> <Del>
nnoremap <Tab> <C-w>w
nnoremap nu :set number relativenumber<CR>
nnoremap nonu :set nonumber norelativenumber<CR>
inoremap (<Enter> ()<Esc>i
inoremap "<Enter> ""<Esc>i
inoremap '<Enter> ''<Esc>i
inoremap [<Enter> []<Esc>i
inoremap {<Enter> {<Enter>}<Esc>ko

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

" vim-commentary
autocmd FileType php setlocal commentstring=//\ %s

" vim-fugitive
set diffopt+=vertical

" vim-signify, <Leader> default is \
nmap <Leader>gt :SignifyToggle<CR>
set updatetime=500

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|vendor$',
  \ 'file': ''
  \ }

" neomake
call neomake#configure#automake('w')
let g:neomake_open_list = 2
