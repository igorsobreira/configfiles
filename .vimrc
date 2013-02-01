
syntax on

set encoding=utf-8

set ignorecase
set nowrap
set smartcase  " if there are caps, go case-sensitive

set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set autoindent

filetype on
au FileType ruby,eruby set softtabstop=2
au FileType ruby,eruby set shiftwidth=2

set autoindent
set cursorline

" Enable bash-like completion
" 1 tab: complete
" 2 tabs: show list
" 3 tabs: cycle
set wildmode=longest,list,full

set novisualbell
set noerrorbells
set ruler " Always show current positions along the bottom
set title
set nostartofline " leave my cursor where it was
set nobackup

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

au! BufRead,BufNewFile *.go           setfiletype go
au! BufRead,BufNewFile *.wsgi         setfiletype python
au! BufRead,BufNewFile *.pp           setfiletype puppet

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


" commands

command! W w
command! Pdb call Pdb()
command! WhitespaceCleanup call WhitespaceCleanup()
