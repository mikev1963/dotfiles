set nocompatible		" Improved
filetype off			" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'chase/vim-ansible-yaml'
Plugin 'lepture/vim-jinja.git'
Plugin 'fatih/vim-go'
Plugin 'davidhalter/jedi-vim'

" ----------------
" My bundles here
" ----------------


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" General
syntax on
set clipboard=unnamed			" Copy to clipboard
set number				" Show line numbers
set autoindent				" Auto-indent new lines
set expandtab				" use space instead of tabs
set shiftwidth=2			" number of auto-indent spaces
set smartindent				" Enable smart-indent
set smarttab				" Enable smart-tabs
set softtabstop=2			" Number of spaces per tab

" Advanced
set ruler				" Show row and column ruler information
set undolevels=1000			" Number of undo levels
set backspace=indent,eol,start		" Backspace behavior

" Copy to clipboard with Ctrl-C
map <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

" paste from clipboard with Ctrl-V
set pastetoggle=<F10>
inoremap <C-v> <F10><C-r>+<F10>

" show filename

" Autoload NERDTree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
set statusline+=%F

" Auto close NERDTree if no more files
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show hidden files in NERDTree
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38


" Syntastic Configurations
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" Python
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 1
let python_highlight_all=1
