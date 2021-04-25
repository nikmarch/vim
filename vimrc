" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" set textwidth=100
set showmatch

" set mouse=a
set cursorline

" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
" command! MakeTags !ctags -R .

" Display all matching files when we tab complete
set wildmenu

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on


" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**
" ================ General Config ====================

execute pathogen#infect()
set number                      "Line numbers are good
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","
set timeout timeoutlen=1500

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Folds ============================

set foldmethod=manual

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Indentation ======================

set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set paste

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
"set linebreak    "Wrap lines at convenient points

" ================ Custom Settings ========================

" Plugin call to ctrl p for fuzzy file search
"

autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
autocmd BufWritePre * :%s/\s\+$//e
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nmap =j :%!python -m json.tool<CR>
"colorscheme jellybeans
colorscheme railscasts
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>r :!ctags -R -f ./.tags .<cr>
set tags=.tags;/
nnoremap <leader>j :!find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; \| sed '/^$/d' \| LANG=C sort > ./.tags<cr>
" set relativenumber

set directory^=$HOME/.vim/swapfiles/

set undofile
set undodir=~/.vim/backups

" Source .zsh files when :sh
set shell=zsh\ --login

" Add new lines in normal mode
nmap <CR><CR> O<ESC>j
nmap <CR> o<Esc>k
" Gary Bernhardt's vimrc
" Current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>

set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

nnoremap <leader>f :CtrlP<cr>
nnoremap <leader>d :CtrlP %:h<cr>
nnoremap <leader>s :CtrlPBuffer<cr>
nnoremap <leader><leader> <c-^>

" terminal"
cabbrev bterm bo term
set termwinsize=10x0
nnoremap <leader>t :bo term<cr>
" use C-z and fg"
