
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set textwidth=100
set showmatch

"set mouse=a

set cursorline
hi CursorLine   cterm=NONE ctermbg=white ctermfg=white guibg=white guifg=white
hi CursorColumn cterm=NONE ctermbg=darkgreen ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
map <C-n> :NERDTreeToggle<CR>

augroup CursorLine
 au!
 au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
 au WinLeave * setlocal nocursorline
augroup END
" Tweaks for browsing
" "let g:netrw_banner=0        " disable annoying banner
" "let g:netrw_browse_split=4  " open in prior window
" "let g:netrw_altv=1          " open splits to the right
" "let g:netrw_liststyle=3     " tree view
" "let g:netrw_list_hide=netrw_gitignore#Hide()
" "let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

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
set number "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

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

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

"
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

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

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
set colorcolumn=120
autocmd BufWritePre * :%s/\s\+$//e
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nmap =j :%!python -m json.tool<CR>
colorscheme jellybeans
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>r :!ctags -R -f ./.git/tags .<cr>
nnoremap <leader>j :!find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; \| sed '/^$/d' \| LANG=C sort > ./.git/tags<cr>
nnoremap <leader>/ :TagbarToggle<cr>
imap ,t <Esc>:tabn<CR>
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
set relativenumber

set directory^=$HOME/.vim/swapfiles/

set undofile
set undodir=~/.vim/backups

" Source .bashrc files when :sh
set shell=bash\ --login

" Add new lines in normal mode
nmap <CR><CR> O<ESC>j
nmap <CR> o<Esc>k
