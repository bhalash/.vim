""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load External Dependencies
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source $HOME/.vim/conf/vundle.vim
source $HOME/.vim/conf/plugins.vim
source $HOME/.vim/conf/themes.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Core Vim Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set term colours.
set t_Co=256 background=dark

" Set colorcheme for terminal (MacVim/gvim theme is set in gvimrc).
" clorscheme 256_noir
colorscheme hybrid

" No need to be vi compatible. I mean, it's 2016.
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
set splitbelow splitright

" Something I set in git changed line-endings to be DOS-only. Bad Mark!
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scrolling and Mice
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set padding when scrolling.
set scrolloff=10 sidescrolloff=10

" Scroll with mouse in insert mode.
set ttymouse=xterm2 mouse=i

" Increase scroll speed.
set ttyfast

" Change how buffer is redrawn. /Should/ increase scroll speed.
set lazyredraw

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion and Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore common temp files and directories.
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.cache,*.bak,*.pyc,*.class
set wildignore+=node_modules

" Menu display output.
set wildmenu wildmode=list:full

" Search as I type, and highlight results.
set incsearch smartcase hlsearch

" Searches are assumed to be global on a line.
set gdefault

" Tabbing
set expandtab ts=4 sw=4 sts=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Saving, Filesystem and History
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Save file when it loses focus.
set autowrite

" More frequent saves and bigger undo history.
set updatecount=50 history=2000 undolevels=2000

" Keep a persistent backup file.
set undofile undodir=.undo,~/tmp,/tmp

" Disable swap files.
set nobackup noswapfile

" Set a directory in case they *are* turned on.
set directory=~/.vim/.tmp,~/tmp,/tmp

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybinds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<space>"

" Use <Tab> to cycle back and forth through windows.
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

" <c-w> is difficult for me to reach given my handedness and keyboard.
nmap <leader><space> <C-w>

" Disable the keybind to access ex mode.
nnoremap Q <Nop>

" Split file.
nmap <silent><leader>v <c-w>v<c-w>l

" Toggle spellchecking.
nmap <leader>sp :setlocal spell!<CR>

" Toggle highlighted results.
nmap <silent><bs> :nohlsearch<CR>

" Use s and S to quickly search and replace in content: sfoo/bar Sfoo/bar.
nmap s :s//<left>
nmap S :%s//<left>

" Quickly jump to start and end of line with less obtuse shortcuts.
nmap E $
nmap B ^

" Toggle line numbering style.
nmap <silent><leader>r :set relativenumber!<CR>

" Reset current file to its last committed state.
nmap <leader>gr :!git checkout %<CR>

" Empty line of content without removing line ending.
nmap <leader>dl :s/.*//<CR> :noh<CR>

" Strip trailing whitespace from the file.
nmap <leader>W :%s/\s\+$//<CR>:let @/=''<CR> :noh<CR>

" Delete all leading spaces on a line.
nmap <silent><leader>d<space> :s/^\s\+//<CR> :noh<CR>

" Quickly yank all lines in the file.
nmap <leader>yy :%y+<CR>

" Replace all lines in the file with the contents of the clipboard.
nmap <silent><leader>rp gg"_dGVp

" Fix the entire indentation of a file according to your tab rules.
nmap <leader>ind gg=G

" Open and close new tab.
nmap <silent><leader>tt :tabnew<CR>:Startify<CR>
nmap <silent><leader>tw :tabclose<CR>

" Progress forward and backwards with multiple panes open.
nmap <silent><leader>r :prev<CR>
nmap <silent><leader>n :n<CR>

" Stop * searches jumping word.
nnoremap * :keepjumps normal! mi*`i<CR>

" Format JSON in buffer.
nmap <silent><leader>js :%!python -m json.tool<CR>

" Highlight the current line and set the colour.
set cul

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shorthand Colorcolumn Option
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RightRuler(...)
  let &l:colorcolumn = a:0 > 0 ? 0 + a:1 : 0
endfunction

command! -nargs=? CC call RightRuler(<f-args>)
