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
Plugin 'tpope/vim-flagship'
Plugin 'tmhedberg/matchit'
Plugin 'altercation/vim-colors-solarized'
Plugin 'chrisbra/vim-diff-enhanced'
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

" Easy plugin add
function! PluginAddNew(pluginURI)
    vsplit $MYVIMRC
    execute "normal! gg?^call vundle#end\<cr>kk"
    execute "normal! oPlugin '".a:pluginURI."'\<esc>"
    write
    quit
    PluginInstall
endfunction

command! -nargs=1 PluginAddNew call PluginAddNew(<q-args>)

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
augroup sourceVIM
    autocmd!
    autocmd! bufwritepost .vimrc source %
augroup END

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

" Working with Fortran
"map <leader>cf ?subroutine<cr>w"myw :Ack ".@a."\n"
augroup fortranCmds
    autocmd!
    autocmd Filetype fortran  noremap <buffer> <leader>m :make 2D<cr>
augroup END

" Window Management (new windows open to the right and below)"
set splitbelow
set splitright

" Red Status Bar
hi StatusLine   ctermfg=15  guifg=#ffffff ctermbg=1 guibg=#4e4e4e cterm=bold gui=bold

" CTags
nmap <leader>tb :TagbarToggle<CR>
set tags=./tags;
let g:easytags_dynamic_files = 1

" Ack find
map <c-f> :Ack<space>

" Debugging with gdb
function! GdbSlimuxBreakPoint()
    let a="SlimuxSendKeys "."'b ".expand('%:t').":".line(".")."\\n'"
    execute a
endfunction

let g:GdbSLimuxDebug_statusline_old = &statusline

function! ToggleGDBDebugMode()
    if !exists('b:GdbSLimuxDebug_modeOn')
        let b:GdbSLimuxDebug_modeOn=0
    endif

    echom b:GdbSLimuxDebug_modeOn

    if(b:GdbSLimuxDebug_modeOn)
        " nunmap <buffer><b>
        " nunmap <buffer><r>
        " nunmap <buffer><n>
        " nunmap <buffer><c>
        " nunmap <buffer><s>
        " nunmap <buffer><d>
        nmap <buffer><t>
        silent echom 'GDB Debug Mode Off'
        let b:GdbSLimuxDebug_modeOn=0
        let &statusline = g:GdbSLimuxDebug_statusline_old
    else
        noremap <buffer><t> :echom 'Mode On'
        " noremap <buffer><b> :call GdbSlimuxBreakPoint()<cr>
        " noremap <buffer><r> :SlimuxSendKeys 'run\n'<cr>
        " noremap <buffer><n> :SlimuxSendKeys 'next\n'<cr>
        " noremap <buffer><c> :SlimuxSendKeys 'cont\n'<cr>
        " noremap <buffer><s> :SlimuxREPLSendLine<cr>
        " " noremap <buffer><d> :SlimuxSendKeys 'delete\n'<cr>:SlimuxSendKeys 'y\n'<cr>
        " noremap <buffer><y> :SlimuxSendKeys 'y\n'<cr>
        silent echom 'GDB Debug Mode On'
        let b:GdbSLimuxDebug_modeOn=1
        let g:GdbSLimuxDebug_statusline_old=&statusline
        set statusline=%f
        set statusline+=\ [GDB\ MODE]
    endif

endfunction

map <leader>gm call ToggleGDBDebugMode()

" yank function name
noremap <leader>yfn <esc>ma?subroutine<cr>wyiw`a
noremap L :tabnext<cr>
noremap H :tabprevious<cr>

" ignore object files and .git repos
set wildignore+=*.o
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Matlab editing
augroup matlabCmds
    autocmd!
    autocmd BufNewFile,BufRead *.m nnoremap <c-e> :SlimuxREPLSendLine<cr>
    autocmd BufNewFile,BufRead *.m inoremap <c-e> <esc>mz:SlimuxREPLSendLine<cr>`za
augroup END

" Easily Edit Tmux Config
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>

" Remap Tmux configs
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
nnoremap <silent> <A-p> :TmuxNavigatePrevious<cr>

" Ack find all calls to this function
function! AckFunctionCall()
    normal! 0wvt("ky
    execute "normal! :Ack! 'call.*".@k."'\<cr>"
endfunction
nnoremap <leader>fc :call AckFunctionCall()<cr>

"" My Fortran Runtime Plugin

let g:FRT_DefaultBinPath = '~/Source/maxwell-nefem/bin/debug/maxwell2D'
let g:FRT_SourceDir='~/Source/maxwell-nefem/source'
let g:FRT_OutFilePattern='outFileLog*'
let g:FRT_defaultOutWinSize = 10
let g:FRT_dataInpReference = '~/Source/maxwell-nefem/source/DGMaxwellTypes.f90'

" Takes as input the run directory and an optional source directory
function! FRTErrorList(...)

    " Setup input arguments
    let nOfArgs = len(a:000)

    let l:runpath = a:1
    if(nOfArgs>1)
        let l:sourceDir = a:2
    else
        let l:sourceDir = g:FRT_SourceDir
    endif

    " choose nsd based on run dir
    "'find ./ -name data.inp | xargs sed -n \'/inputData%nsd/s/.*=\s*//p\'
    let l:sysCmd = 'find '.l:runpath.' -name data.inp | xargs sed -n ''/inputData%nsd/s/.*=\s*//p'''
    let l:nsd = system(l:sysCmd)
    let l:nsd = split(l:nsd,'\v\n')[0]
    let l:FRT_BinPath = l:sourceDir.'/bin/debug/maxwell'.l:nsd.'D'

    " Use bin file defined by source dir, based on nsd in runpath/data.inp
    let l:tryBinPath = l:runpath.'/maxwell-bin'
    if(empty(glob(l:tryBinPath)))
        let l:FRT_BinPath = g:FRT_DefaultBinPath
    else
        let l:FRT_BinPath = l:tryBinPath
    endif

    " Clean up outfiles
    call system("rm ".l:runpath."/outFileLog*")

    " Build Command
    let l:FRT_command = 'cd '.l:runpath.';'.l:FRT_BinPath
    let l:FRT_system = system(l:FRT_command)
    let l:FRT_output = split(l:FRT_system,'\v\n')
    echom 'RUN: '.l:FRT_command

    " Update return window if we're not in a buffer
    let currWindw = winnr()
    if(exists('s:FRT_BufferWinNum') && currWindw!=s:FRT_BufferWinNum)
        let s:FRT_returnWindow = currWindw
    endif

    " Close data.inp referenc window if open
    let l:dataInputWin = bufwinnr(g:FRT_dataInpReference)
    if(l:dataInputWin!=-1)
        " Change to window
        execute l:dataInputWin."wincmd w"
        " close window
        wincmd c
    endif

    " Create New buffer for content
    let s:FRT_BufferWinNum = bufwinnr('__FRTErrorList__')
    if(s:FRT_BufferWinNum==-1)
        split __FRTErrorList__
        setlocal buftype=nofile
    else
        execute s:FRT_BufferWinNum."wincmd w"
    endif

    " Clear Buffer
    normal! ggdG

    " Get buffer length
    let l:FRT_numberOfLinesOutput = len(l:FRT_output)

    " Get the output
    if(l:FRT_numberOfLinesOutput>0)
        " Remove last entry in buffer if required
        if(len(l:FRT_output[l:FRT_numberOfLinesOutput-1])==0)
            let l:FRT_output=l:FRT_output[0:l:FRT_numberOfLinesOutput-2]
        endif

        " Append cmd output if there is some
        call append(0,l:FRT_output)

        " Special treatment for data.inp errors - just jump straight to the error
        if(l:FRT_output[0]=~"data.inp")
            call FRTOpenDataInpFile()
        elseif(l:FRT_output[0]=~"ERR->.*:")
            call FRTOpenOutFile(l:runpath)
            call FRTProgramError()
        else
            exec "resize ".l:FRT_numberOfLinesOutput
            execute "normal! gg/\\.f90\<cr>dd"
            map <buffer> <cr> :call FRTOpenFile()<cr>
            map <buffer> v :call FRTOpenFileInVertSplit()<cr>
        endif
    else
        call FRTOpenOutFile(l:runpath)
    endif
endfunction

command! -nargs=1 -complete=file FRun call FRTErrorList(<q-args>)

function! FRTOpenOutFile(runpath)
    " Else write the output file instead
    normal! gg
    let l:FRT_sysCmd = 'find '.a:runpath." -name '".g:FRT_OutFilePattern."*' | head -1"
    let l:FRT_outputFile = split(system(l:FRT_sysCmd),'\v\n')[0]
    echom 'FIND OUTPUT FILE CMD: '.l:FRT_sysCmd
    execute "read ".l:FRT_outputFile
    exec "resize ".g:FRT_defaultOutWinSize
    normal! ggddGp
endfunction

function! FRTProgramError()
    execute "normal! gg/ERR\<cr>"
    normal! "ky$
    let l:ErrorStr = @k
    execute 'Ack! '''.l:ErrorStr.''''
endfunction

function! FRTGetFileDetail()
    " Yank file name
    normal! $viW"ky
    let l:FRT_fileName=@k

    " Yank file line number
    normal! Bviw"ky
    let s:FRT_fileLineNo=@k

    " Find file
    let s:FRT_filePath = split(system('find '.g:FRT_SourceDir.' -name '.l:FRT_fileName),'\v\n')[0]
endfunction

function! FRTOpenDataInpFile()
    resize 4 

    " Get data.inp file name
    execute "normal! gg/data.inp\<cr>"
    normal! viW"ky
    let l:filename = split(@k,'\v,')[0]

    " Get data.inp file number
    execute "normal! 0/line\<cr>"
    normal! WviW"ky
    let l:lineNumber = split(@k,'\v,')[0]

    " Open data.inp
    if(exists('s:FRT_returnWindow'))
        execute s:FRT_returnWindow."wincmd w"
    endif
    execute 'edit '.l:filename
    execute 'normal! '.l:lineNumber.'G'
    let l:winNum = winnr()

    " Open data.inp reference + scroll to top
    execute 'vsplit '.g:FRT_dataInpReference
    execute "normal! gg/inputVariableData\<cr>zt"
    let s:FRT_dataFileInputWindow=winnr()

    " Put focus on data.inp file
    execute l:winNum.'wincmd w'
endfunction

function! FRTOpenFile()
    call FRTGetFileDetail()
    if(exists('s:FRT_returnWindow'))
        execute s:FRT_returnWindow."wincmd w"
    endif
    execute 'edit '.s:FRT_filePath
    execute 'normal! '.s:FRT_fileLineNo.'G'
endfunction

function! FRTOpenFileInVertSplit()
    call FRTGetFileDetail()
    execute s:FRT_returnWindow."wincmd w"
    execute 'vsplit '.s:FRT_filePath
    execute 'normal! '.s:FRT_fileLineNo.'G'
endfunction

nnoremap <buffer> <localleader>d :call FRTErrorList()<cr>
