
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

au! BufRead,BufNewFile *.wsgi         setfiletype python
au! BufRead,BufNewFile *.pp           setfiletype puppet
au! BufRead,BufNewFile Vagrantfile    setfiletype ruby

au FileType ruby,eruby setlocal softtabstop=2
au FileType ruby,eruby setlocal shiftwidth=2

au FileType go,make setlocal noexpandtab

au FileType puppet setlocal shiftwidth=2
au FileType puppet setlocal softtabstop=2

au FileType html setlocal shiftwidth=2
au FileType html setlocal softtabstop=2

"au FileType javascript setlocal shiftwidth=2
"au FileType javascript setlocal softtabstop=2

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


" commands

command! W w
command! Pdb call Pdb()
command! WhitespaceCleanup call WhitespaceCleanup()

" go integration
filetype off
filetype plugin indent off
let go_highlight_trailing_whitespace_error = 0
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" :Fmt command will not only format the code but also include/remove
" imports as necessary
let g:gofmt_command = "goimports"

" Automatically call :Fmt when .go file is saved
" autocmd BufWritePre *.go Fmt

" don't scroll when spliting window
nnoremap <C-W>s Hmx`` \|:split<CR>`xzt``
