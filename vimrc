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
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
" ctr c instead of escape
inoremap <c-c> <esc>

nnoremap =j :%!python -m json.tool<CR>

"colorscheme jellybeans
colorscheme railscasts

" nnoremap <leader>. :CtrlPTag<cr>
" nnoremap <leader>r :!ctags -R -f ./.tags .<cr>
" set tags=.tags;/
" nnoremap <leader>j :!find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; \| sed '/^$/d' \| LANG=C sort > ./.tags<cr>
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

nnoremap <leader>m :CtrlP<cr>
nnoremap <leader>d :CtrlP %:h<cr>
nnoremap <leader>s :CtrlPBuffer<cr>
nnoremap <leader><leader> <c-^>

" terminal"
cabbrev bterm bo term
set termwinsize=10x0
"nnoremap <leader>t :bo term<cr>
" use C-z and fg"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col
        return "\<tab>"
    endif

    let char = getline('.')[col - 1]
    if char =~ '\k'
        " There's an identifier before the cursor, so complete the identifier.
        return "\<c-p>"
    else
        return "\<tab>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Selecta Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    exec a:vim_command . " " . SelectaOutput(a:choice_command, a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
endfunction

function! SelectaOutput(choice_command, selecta_args)
  let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  " Escape spaces in the file name. That ensures that it's a single argument
  " when concatenated with vim_command and run with exec.
  let selection = substitute(selection, ' ', '\\ ', "g")
  redraw!
  return selection
endfunction

function! SelectaFile(path, glob, command)
  call SelectaCommand("fd -t f . " . a:path, "", a:command)
endfunction

function! SelectaFileContents(ext)
  try
    "let selection = SelectaOutput("ls src/**/*.ts* | while read fn; do nl -b a \"$fn\" | while read line; do echo \"$fn:$line\"; done; done", "| cut -d \"	\" -f 1")
    let selection = SelectaOutput("ls **/*.".a:ext." | while read fn; do nl -b a \"$fn\" | while read line; do echo \"$fn:$line\"; done; done", "| cut -d \"	\" -f 1")
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  exec substitute(selection, "^\\([^:]\\+\\):\\([0-9]\\+\\).*$", ":e +\\2 \\1", "")
endfunction

nnoremap <leader>f :call SelectaFile(".", "*", ":e")<cr>
nnoremap <leader>rb :call SelectaFileContents("rb")<cr>
nnoremap <leader>js :call SelectaFileContents("js")<cr>
nnoremap <leader>ts :call SelectaFileContents("ts")<cr>
nnoremap <leader>gv :call SelectaFile("app/views", "*", ":edit")<cr>
nnoremap <leader>gc :call SelectaFile("app/controllers", "*", ":edit")<cr>
nnoremap <leader>gm :call SelectaFile("app/models", "*", ":edit")<cr>
nnoremap <leader>gh :call SelectaFile("app/helpers", "*", ":edit")<cr>
nnoremap <leader>gl :call SelectaFile("lib", "*", ":edit")<cr>
nnoremap <leader>gp :call SelectaFile("public", "*", ":edit")<cr>
nnoremap <leader>gs :call SelectaFile("app/assets/stylesheets", "*.sass", ":edit")<cr>
nnoremap <leader>e :call SelectaFile(expand('%:h'), "*", ":edit")<cr>
nnoremap <leader>v :call SelectaFile(expand('%:h'), "*", ":view")<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM-ALE CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {'javascript': [], 'typescript': ['tsserver', 'eslint'], 'typescript.tsx': ['tsserver', 'eslint']}
let g:ale_fixers = {'javascript': [], 'typescript': ['prettier'], 'typescript.tsx': ['prettier']}
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 0
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 0
let g:ale_javascript_eslint_executable = 'eslint --cache'
nnoremap gj :ALENextWrap<cr>
nnoremap gk :ALEPreviousWrap<cr>
nnoremap g1 :ALEFirst<cr>
" This mapping will kill all ALE-related processes (including tsserver). It's
" necessary when those processes get confused. E.g., tsserver will sometimes
" show type errors that don't actually exist. I don't know exactly why that
" happens yet, but I think that it's related to renaming files.
nnoremap g0 :ALEStopAllLSPs<cr>
