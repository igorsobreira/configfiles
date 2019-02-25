
" setup Vundle

filetype off                         " required for Vundle
set rtp+=~/.vim/bundle/Vundle.vim    " set the runtime path to include Vundle
call vundle#begin()                  " ...and initialize

Plugin 'VundleVim/Vundle.vim'        " let Vundle manage Vundle, required
Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'majutsushi/tagbar'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on

set hlsearch
set background=dark
colorscheme default

set encoding=utf-8
set nocompatible

set ignorecase
set nowrap
set smartcase  " if there are caps, go case-sensitive

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set autoindent

set nocursorline

" Enable bash-like completion
" 1 tab: complete
" 2 tabs: show list
" 3 tabs: cycle
set wildmode=longest,list,full

set novisualbell
set noerrorbells
set ruler         " Always show current positions along the bottom
set title
set nostartofline " leave my cursor where it was
set nobackup
set noea          " don't rezise window splits when one is cloed

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set laststatus=2 " always show the status line
set statusline=%f\ %y%=[%L-%l,%v]
"set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v
 "              | | | | |  |   |      |  |     |    |
 "              | | | | |  |   |      |  |     |    + current 
 "              | | | | |  |   |      |  |     |       column
 "              | | | | |  |   |      |  |     +-- current line
 "              | | | | |  |   |      |  +-- current % into file
 "              | | | | |  |   |      +-- current syntax in 
 "              | | | | |  |   |          square brackets
 "              | | | | |  |   +-- current fileformat
 "              | | | | |  +-- number of lines
 "              | | | | +-- preview flag in square brackets
 "              | | | +-- help flag in square brackets
 "              | | +-- readonly flag in square brackets
 "              | +-- rodified flag in square brackets
 "              +-- full path to file in the buffer

au! BufRead,BufNewFile *.wsgi         setfiletype python

au FileType ruby,eruby setlocal softtabstop=2
au FileType ruby,eruby setlocal shiftwidth=2

au FileType go,make setlocal noexpandtab

au FileType puppet setlocal shiftwidth=2
au FileType puppet setlocal softtabstop=2

au FileType htmldjango,html setlocal shiftwidth=2
au FileType htmldjango,html setlocal softtabstop=2

au FileType yaml setlocal softtabstop=2
au FileType yaml setlocal shiftwidth=2

au FileType javascript setlocal shiftwidth=2
au FileType javascript setlocal softtabstop=2

" this this markdown extension for github extras
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" functions

function! Pdb()
    " replace the current line (where the cursor is) with a pdb
    let ident = repeat(" ", col("."))
    call setline(line("."), ident . "import pdb; pdb.set_trace()")
endfunction

function! WhitespaceCleanup()
    " save search history and cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    " remove trailing whitespaces
    %s/\s\+$//e
    " restore search history and cursor position
    let  @/=_s
    call cursor(l, c)
endfunction


let go_highlight_trailing_whitespace_error = 0
let g:go_fmt_command = "goimports"

" commands

command! W w
command! Wq wq
command! Pdb call Pdb()
command! WhitespaceCleanup call WhitespaceCleanup()

" don't scroll when spliting window
nnoremap <C-W>s Hmx`` \|:split<CR>`xzt``

" open NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle<CR>

" tabs
map <C-t>p :tabp<cr>
map <C-t>n :tabn<cr>

