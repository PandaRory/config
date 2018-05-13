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
Plugin 'sickill/vim-monokai'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'adelarsq/vim-matchit'
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'   " snipmate's dependencie
Plugin 'tomtom/tlib_vim'                " snipmate's dependencie
Plugin 'honza/vim-snippets'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use: filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

syntax enable
colorscheme monokai
set encoding=utf8
set t_Co=256
set number
set cursorline
set tabstop=4
set expandtab
set shiftwidth=4
set autochdir
set autoindent

set statusline=%{fugitive#head(7)}\ %F\ %=%l/%L
set laststatus=2

set wildmenu    " Command-line completion

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
highlight Search ctermfg=Red

inoremap <C-d> <Del>
nnoremap <Tab> <C-w>w
inoremap (<Enter> ()<Esc>i
inoremap "<Enter> ""<Esc>i
inoremap '<Enter> ''<Esc>i
inoremap [<Enter> []<Esc>i
inoremap {<Enter> {<Enter>}<Esc>ko

" NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-commentary
autocmd FileType php setlocal commentstring=#\ %s

" vim-fugitive
set diffopt+=vertical

" vim-gitgutter, <Leader> default is \
nnoremap <Leader>g :GitGutterSignsToggle<CR>
set updatetime=500

