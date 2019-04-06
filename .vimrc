" Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" vim-plug configuration
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" display the result when searching
Plug 'henrik/vim-indexed-search'
Plug 'markonm/traces.vim'

" wrapper for git and display git diff in the left gutter
Plug 'tpope/vim-fugitive' | Plug 'mhinz/vim-signify'
" fugitive for the hub
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'

Plug 'andymass/vim-matchup'

" Display commits for project / file
Plug 'junegunn/gv.vim'

" surrounding text objects with whatever you want (paranthesis, quotes, html tags...)
Plug 'tpope/vim-surround'

" easily search, substitute and abbreviate multiple version of words
Plug 'tpope/vim-abolish'

" the . command can repeat whatever you want!
" http://vimcasts.org/episodes/creating-repeatable-mappings-with-repeat-vim/
Plug 'tpope/vim-repeat'

" keystroke to comment automatically depending on the file you're in
Plug 'tpope/vim-commentary'

" Highlight briefly every yank text
Plug 'machakann/vim-highlightedyank'

" add new text object (can delete between comma with di, for example)
Plug 'wellle/targets.vim'

" snippet engine + snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Align plugin
Plug 'godlygeek/tabular'

" php
Plug 'joonty/vdebug'
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
Plug 'nishigori/vim-php-dictionary', {'for': 'php'}
Plug 'alvan/vim-php-manual', {'for': 'php'}
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'phpstan/vim-phpstan', {'for': 'php'}

" php refactoring options
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug '2072/php-indenting-for-vim', {'for': 'php'}

" php doc autocompletion
Plug 'tobyS/vmustache' | Plug 'tobyS/pdv', {'for': 'php'}

Plug 'mustache/vim-mustache-handlebars'

" autocompletion
Plug 'ncm2/ncm2', {'for': 'php'}
Plug 'roxma/nvim-yarp', {'for': 'php'}
Plug 'roxma/vim-hug-neovim-rpc', {'for': 'php'}
Plug 'ncm2/ncm2-ultisnips', {'for': 'php'}
Plug 'phpactor/ncm2-phpactor', {'for': 'php'}

" javascript plugins
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx', 'vue'], 'do': 'npm install'}

" For Vue
Plug 'posva/vim-vue'

" status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'

" undo tree
Plug 'sjl/gundo.vim'

" registers
Plug 'bfredl/nvim-miniyank'
" close the current buffer
Plug 'moll/vim-bbye'

" emmet for html
Plug 'mattn/emmet-vim'

" fzf - poweful fuzzy finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" allow multisearch in current directory / multi replace as well
Plug 'wincent/ferret'


" colors matching bracket pairs
Plug 'luochen1990/rainbow'

" solarized color scheme
Plug 'altercation/vim-colors-solarized'

" syntax coloring
Plug 'sheerun/vim-polyglot'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'

" display the hexadecimal colors - useful for css and color config
Plug 'ap/vim-css-color'
Plug 'shmargum/vim-sass-colors'

" text objects and dependent plugins
Plug 'kana/vim-textobj-user'
"Plug 'jasonlong/vim-textobj-css'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'Julian/vim-textobj-brace'
Plug 'Chun-Yang/vim-textobj-chunk'
Plug 'Julian/vim-textobj-variable-segment'

" replace f F t T to target easily the motion
Plug 'yangmillstheory/vim-snipe'

" Split arrays in PHP / struct in Go / other things
Plug 'AndrewRadev/splitjoin.vim'

" Write file with sudo
Plug 'lambdalisue/suda.vim'

" Display register values on " and @
Plug 'junegunn/vim-peekaboo'

Plug 'w0rp/ale'

Plug 'janko-m/vim-test'

" Add plugins to &runtimepath
call plug#end()

" +---------------+
" | plugin config |
" +---------------+

" source every plugin configs
for file in split(glob("~/.vim/pluggedconf/*.nvimrc"), '\n')
    exe 'source' file
endfor

let g:vim_markdown_folding_disabled = 1
" +-----------------+
" | general binding |
" +-----------------+

syntax on

" change the mapleader from \ to ,
let mapleader=","

" Act like D and C
nnoremap Y y$

" indent without kill the selection in vmode
vmap < <gv
vmap > >gv

set tabstop=4
set shiftwidth=0
set expandtab

" remap the annoying u in visual mode
vmap u y

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
set wildmenu

" Change in next bracket
nmap cinb cib

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call general#VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call general#VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" location & quickfix window
nnoremap <silent> <leader>l :call general#ToggleList("Location List", 'l')<CR>
nnoremap <silent> <leader>q :call general#ToggleList("Quickfix List", 'c')<CR>

"Toggle between absolute -> relative line number
nnoremap <C-n> :let [&nu, &rnu] = [&nu, &nu+&rnu==1]<CR>

" tabs
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>

" move tab to first position
nnoremap tF :tabm 0<CR>
nnoremap tL :tabm<CR>

" windows navigation
" use ctrl + hjkl

" nnoremap <leader>ww <c-w>w
" nnoremap <leader>wh <c-w>h
" nnoremap <leader>wj <c-w>j
" nnoremap <leader>wk <c-w>k
" nnoremap <leader>wl <c-w>l

" close all windows except the current one
nnoremap <leader>wco :only<cr>
nnoremap <leader>wcc :cclose<cr>

" Disable anoying ex mode
nnoremap Q <Nop>

" Save files as root
cnoremap w!! execute ':w suda://%'

" +----------------+
" | general config |
" +----------------+

" colorscheme
set background=dark
colo solarized

" set the directory where the swap file will be saved
set backupdir=~/.vimbackup/
set directory=~/.vimswap/

" save undo trees in files
set undofile
set undodir=~/.vimundo/

" set line number
set number

" the copy goes to the clipboard
set clipboard+=unnamed

" when at 3 spaces, and I hit > ... go to 4, not 7
set shiftround

" number of undo saved in memory
set undolevels=10000 " How many undos
set undoreload=10000 " number of lines to save for undo

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" set list
set list listchars=tab:\┆\ ,trail:·,nbsp:±

" relative / hybrid line number switch
set number relativenumber

let g:ale_linters = { 'php': ['php', 'psalm', 'phpstan'] }
let g:ale_linters = { 'javascript': ['eslint'] }
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
hi SignColumn ctermbg=NONE guibg=NONE
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_sign_error = '💣'
let g:ale_sign_error = '⚠'
let g:ale_sign_error = '💩'
let g:ale_sign_warning = '💩'

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType scss setlocal iskeyword+=-
augroup END

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

let g:airline_solarized_bg='dark'

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set mouse=a       " Enable mouse in all modes
set ttymouse=xterm2

" Color adjustments
syntax enable
set background=dark
colorscheme solarized

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

 " When editing a file, always jump to the last known cursor position.
 " Don't do it for commit messages, when the position is invalid, or when
 " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

 " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

