
syntax on
filetype on
filetype plugin on

set encoding=utf-8
set fileformat=unix
set number

set expandtab
set ignorecase
set nowrap
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set smartcase " if there are caps, go case-sensitive
set shiftwidth=4
set softtabstop=4
set tabstop=8
"set smarttab

au FileType ruby set softtabstop=2
au FileType ruby set shiftwidth=2

set incsearch

set autoindent

"set foldmethod=indent

" Enable bash-like completion
" 1 tab: complete
" 2 tabs: show list
" 3 tabs: cycle
set wildmode=longest,list,full
set wildmenu

set visualbell
set mouse=a
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

set cursorline

" Comment/Uncomment for different languages
au FileType sh,make,python,ruby         let comment = '#'
au FileType c,cpp,java,javascript       let comment = '//'
au FileType vim                         let comment = '"'

" Comment Blocks
" ,c -> comment selected
" ,u -> uncomment selected
noremap <silent> ,c :s,^,<C-R>=comment<CR>,<CR>:noh<CR>
noremap <silent> ,u :s,^\V<C-R>=comment<CR>,,e<CR>:noh<CR>

" Tabs
" Shift + h -> go left
" Shift + l -> go right
" Alt   + n -> go to tab n  ==> not working :(
noremap <silent> ,t <ESC>:tabnew<CR>
noremap <silent> <S-h> gT
noremap <silent> <S-l> gt
noremap <silent> <A-1> 1gt
noremap <silent> <A-2> 2gt

" CommandT
"noremap <C-t> :<C-u>CommandT<CR>

" Python
"let python_highlight_all = 1
au BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with,not
