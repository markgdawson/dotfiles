" Latex plugin overwrites pluging from tmux-vim-navigator
imap <C-space> <Plug>IMAP_JumpForward

"""""""""""""""""""""""""""""""""""""""""""""
""             Vundle
""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/matchit'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'lrvick/Conque-Shell'
Plugin 'sgeb/vim-matlab'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'easymotion/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'sjl/gundo.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'epeli/slimux'
Plugin 'majutsushi/tagbar'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""
""             Start RC
""""""""""""""""""""""""""""""""""""""""""""""

let t_Co=16

" Themes
syntax enable
set background=dark
colorscheme solarized

" Tab setting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Searching and moving
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Line Wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85

" Movement by screen line not file line
"nnoremap j gj
"nnoremap k gk


"set relativenumber
set number
set encoding=utf-8
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" autoread and autowrite
augroup save
  au!
  au FocusLost * wall
augroup END
set nohidden
set nobackup
set noswapfile
set nowritebackup
set autoread
set autowrite
set autowriteall

" Restore Cursor to previous editing position
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" persistent-undo
set undodir=~/.vim/undo
set undofile

" Vim Explorer Tree
let g:netrw_liststyle=30

" Latex
" compile to pdf                              
let g:Tex_DefaultTargetFormat = 'pdf' 

" pdf compile and view settings                                
"let g:Tex_ViewRule_pdf = 'open -a Preview'
"let g:Tex_CompileRule_pdf = 'pdflatex Thesis.tex'
nmap <leader>kk <leader>ll:!scppdf<cr>

" ignore all warnings below level 4
let g:TCLevel = 4

" one last thing for latex
let g:tex_flavor = 'latex'
let g:Tex_GotoError=1

" Fortran
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_more_precise=1
let fortran_fold=1
let fortran_fold_conditionals=1
let fortran_fold_multilinecomments=1

let fortran_do_enddo=1

" Set folding off by default
" Keep all folds open when a file is opened
augroup OpenAllFoldsOnFileOpen
autocmd!
autocmd BufRead * normal zR
augroup END

" Font
set guifont=DejaVu\ Sans\ Mono\ 14

" ConqueGdb
" autocmd VimEnter * ConqueGdbExe /Volumes/HardDrive/Users/mark/bin/gdb-intel

noremap bp :exe "!echo ".expand('%:t').":".line(".")." \| pbcopy"<CR><CR>

filetype indent on
let g:tex_flavor='latex'

let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50
noremap eq C\begin{equation}o\label{eq:}€klml/$$0C\end{equation}'l`l

noremap - ddp
noremap _ ddkP
let maplocalleader = " "
let mapleader = " "
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
inoremap jk <esc>
inoremap <esc> <nop>

" Latex specific shortcuts
imap <c-space> <Plug>Tex_Completion
nnoremap <leader>enc :vsplit ./newCommands.tex<cr>

" Fix xcode keys
execute "set <xUp>=\e[1;*A"
execute "set <xDown>=\e[1;*B"
execute "set <xRight>=\e[1;*C"
execute "set <xLeft>=\e[1;*D"
execute "set <xHome>=\e[1;*H"
execute "set <xEnd>=\e[1;*F"
execute "set <PageUp>=\e[5;*~"
execute "set <PageDown>=\e[6;*~"
execute "set <F1>=\eOP"
execute "set <F2>=\eOQ"
execute "set <F3>=\eOR"
execute "set <F4>=\eOS"
execute "set <xF1>=\eO1;*P"
execute "set <xF2>=\eO1;*Q"
execute "set <xF3>=\eO1;*R"
execute "set <xF4>=\eO1;*S"
execute "set <F5>=\e[15;*~"
execute "set <F6>=\e[17;*~"
execute "set <F7>=\e[18;*~"
execute "set <F8>=\e[19;*~"
execute "set <F9>=\e[20;*~"
execute "set <F10>=\e[21;*~"
execute "set <F11>=\e[23;*~"
execute "set <F12>=\e[24;*~"

set nrformats=

" MATLAB
noremap <leader>ms :ConqueTermSplit matlab -nodesktop -nosplash<cr><esc>:res -5<cr>
nmap <leader>r :let @" = "run('".expand("%")."')\n"<cr><c-w><c-w>p<cr>
inoremap <c-b> <esc><c-w><c-w>

" Working with Fortran
"map <leader>cf ?subroutine<cr>w"myw :Ack ".@a."\n"
augroup fortranCmds
    autocmd!
    autocmd Filetype fortran  noremap <buffer> <leader>m :make
augroup end
augroup matlabCmds
    autocmd!
    autocmd BufNewFile,BufRead *.m nnoremap <c-e> :SlimuxREPLSendLine<cr>
    autocmd BufNewFile,BufRead *.m inoremap <c-e> <esc>mz:SlimuxREPLSendLine<cr>`za
augroup end

" Window Management (new windows open to the right and below)"
set splitbelow
set splitright

" Easily Edit Tmux Config
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>

" Red Status Bar
hi StatusLine   ctermfg=15  guifg=#ffffff ctermbg=1 guibg=#4e4e4e cterm=bold gui=bold
nnoremap <c-w>h <c-w>s

" CTags
nmap <leader>tb :TagbarToggle<CR>
set tags=./tags;
let g:easytags_dynamic_files = 1

" Ack find
map <c-f> :Ack<space>

" yank function name
noremap <leader>yfn <esc>ma?subroutine<cr>wyiw`a
noremap L :tabnext<cr>
noremap H :tabprevious<cr>

" ignore object files and .git repos
set wildignore+=*.o
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
