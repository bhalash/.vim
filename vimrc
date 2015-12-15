""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Init
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Required for Vundle.
filetype off

" Start of Vundle goodness.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Primary for terminal.
Plugin 'queyenth/oxeded.vim'

" Primary for gvim/MacVim
Plugin 'ajgrf/sprinkles'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle plugins.
Plugin 'VundleVim/Vundle.vim'

" PHP linter.
Plugin 'nrocco/vim-phplint'

" Better SCSS markup.
Plugin 'cakebaker/scss-syntax.vim'

" Autoamtically close braces and brackets.
Plugin 'jiangmiao/auto-pairs'

" Supertab.
Plugin 'ervandew/supertab'

" HTML and CSS auto-completion.
Plugin 'mattn/emmet-vim'

" JSON parse plugin.
Plugin 'elzr/vim-json'

" Fuzzy file matchng.
Plugin 'kien/ctrlp.vim'

" Ruby and Rails utilities. Tim Pope is God.
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-bundler'

" Highlight matching HTML tags.
Plugin 'gregsexton/MatchTag'

" HTML5 validation.
Plugin 'bhalash/vim-htmlvalidator'

" Folder browser.
Plugin 'scrooloose/nerdtree'

" Toggle comments.
Plugin 'tomtom/tcomment_vim'

" Diff git files live.
Plugin 'airblade/vim-gitgutter'

" Nicer welcome screen.
Plugin 'mhinz/vim-startify'

" Uber statusline.
Plugin 'bling/vim-airline'

" End of Vundle goodness.
call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Core Vim Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" No need to be vi compatible. I mean, it's almost 2016.
set nocompatible

" Yank to system clipboard.
set clipboard=unnamed

" Enable syntax highlighting.
syntax on

" Backspace will delete.
set backspace=indent,eol,start

" Set relative numbering and toggle keybind.
set relativenumber

" Open split below and to the right instead of up and to the left.
set splitbelow
set splitright

" Something I set in git changed line-endings to DOS. Bad Mark!
set ffs=unix,dos

" Follow auto indent.
set autoindent

" Wrap lines outside of words.
set wrap linebreak nolist

" Enable line numbers.
set nu

" Enable ruler for column count.
set ruler

" Enable statusbar.
set laststatus=2

" ex mode reads the top n lines of a file.
set modelines=0

" Stop annoying problem on OS X.
" Arrow keybinds cause a status popup to appear when I tab back to vim.
set shortmess=a

" Reduce timeout length on keystrokes. This is mostly for vim-airline's mode
" changes.
set ttimeout
set ttimeoutlen=50

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scrolling and Mice
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set padding when scrolling.
set scrolloff=5
set sidescrolloff=5

" Scroll with mouse.
set ttymouse=xterm2
set mouse=i

" Increase scroll speed.
set ttyfast

" Change how buffer is redrawn. /Should/ increase scroll speed.
set lazyredraw

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore common temp files and directories.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.cache,*.bak,*.pyc,*.class
set wildignore+=node_modules

" Menu display output.
set wildmenu
set wildmode=list:full

" Search as I type, and highlight results.
set incsearch
set hlsearch

" Searches are assumed to be global on a line.
set gdefault

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" HTML validation.
au FileType html compiler html

" Autocomplete CSS.
set omnifunc=syntaxcomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filesystem
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Undo history.
set history=1000
set undolevels=1000

" Keep a persistent backup file.
set undofile
set undodir=~/.vim/.undo,~/tmp,/tmp

" Disable swap files.
set nobackup
set noswapfile

" Set a directory in case they *are* turned on.
set directory=~/.vim/.tmp,~/tmp,/tmp

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabbing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Number of columns in a tab.
set tabstop=4

" Amount to indent on tab, << or >>.
set shiftwidth=4

" Columns in insert mode.
set softtabstop=4

" Replace tabs with spaces.
set expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance (as related to the oxeded theme)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight the current line and set the colour.
set cul

if !has('gui_running')
  hi CursorLine term=none cterm=none gui=none ctermbg=234 guibg=#1c1c1c guifg=#ffffff

  " Change matching bracket style.
  hi MatchParen cterm=bold ctermfg=0 ctermbg=15

  " Default theme.
  colors oxeded
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Bind CtrlP to...Ctrl + P.
let g:ctrlp_map = '<leader>p'
" Set default folder to starting folder.
let g:ctrlp_working_path_mode = 'ra'

" Ignore Rails temp and documentation files.
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](tmp|doc)$',
  \ 'file': '\v\.(cache)$',
  \ }

" Supertab.
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" Disable markdown folding on load.
let g:vim_markdown_folding_disabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Startify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:startify_custom_header = [
  \ '             __                  ',
  \ '    __  __  /\_\     ___ ___     ',
  \ '   /\ \/\ \ \/\ \  /` __` __`\   ',
  \ '   \ \ \_/ | \ \ \ /\ \/\ \/\ \  ',
  \ '    \ \___/   \ \_\\ \_\ \_\ \_\ ',
  \ '     \/__/     \/_/ \/_/\/_/\/_/ v.' . version,
  \ '   -----------------------------------',
  \ '   ' . system('echo -n "${USERNAME}@$(hostname -s) in ${PWD}"'),
  \ ''
  \ ]

let g:startify_custom_footer = [
  \ '',
  \ "   Vim is charityware. Please read ':help uganda'.",
  \ '',
  \ ''
  \ ]

let g:startify_bookmarks = [
  \ {'v': '~/.vim/vimrc'},
  \ {'g': '~/.vim/gvimrc'},
  \ {'z': '~/.zsh/zshrc'}
  \ ]

" Reuse the Startify window when files are opened with CtrlP, instead of
" opening them inside a split.
autocmd FileType startify setlocal buftype=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"

" Disable the keybind to access ex mode.
nnoremap Q <Nop>

" Remap line-jump keys.
nmap B ^
nmap E $

" Split file.
nmap <leader>v <C-w>v<C-w>l

" Toggle spellchecking.
nmap <leader>sp :setlocal spell!<CR>

" Toggle highlighted results.
nmap <leader>h :nohlsearch<CR>

" Toggle line numbering style.
nmap <leader>r :set relativenumber!<CR>

" Toggle gutter vim diff highlights.
nmap <leader>gg :GitGutterToggle<CR>

" Replacements

" Empty line of content without removing line ending.
nmap <leader>dl :s/.*//<CR> :noh<CR>

" Strip trailing whitespace from the file.
nmap <leader>W :%s/\s\+$//<CR>:let @/=''<CR> :noh<CR>

" Delete all leading spaces on a line.
nmap <leader>d<space> :s/^\s\+//<CR> :noh<CR>

" Tabs

" Open and close new tab.
nmap <leader>t :tabnew<CR>
nmap <leader>w :tabclose<CR>

" NERDTree

" Toggle file tree.
nmap <leader>nn :NERDTreeToggle<CR>
" Find current open file.
nmap <leader>nf :NERDTreeFind<CR>

" Return to Startify screen.
nmap <leader>ss :Startify<CR>
