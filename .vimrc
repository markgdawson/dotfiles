" Latex plugin overwrites pluging from tmux-vim-navigator
imap <C-space> <Plug>IMAP_JumpForward

"""""""""""""""""""""""""""""""""""""""""""""
""             Vundle
""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
    let g:editor_root=expand("~/.config/nvim")
else
    let g:editor_root=expand("~/.vim")
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
let &rtp= &rtp . ',' . g:editor_root . '/bundle/Vundle.vim/'
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
Plugin 'vim-scripts/fortran_codecomplete.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-surround'
Plugin 'kassio/neoterm'
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

" Scrolling
set scrolloff=999

" Line Wrapping
set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85

" Movement by screen line not file line
"nnoremap j gj
"nnoremap k gk

" Plugin
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorLine   cterm=NONE ctermbg=white guibg=white
augroup CursorLine
au!
au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

"set relativenumber
set number
if(!has('nvim'))
    set encoding=utf-8
endif
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

" Git diff
set diffopt+=vertical

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
        normal! g`"zz
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
nnoremap <leader>sv :source $MYVIMRC<cr>
augroup sourceVIM
    autocmd!
    autocmd! bufwritepost .vimrc source %
augroup call allocInt1D(new, stat=allocateStatus,,,'new, stat=allocateStatus','subroutine uniqueInteger')

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
set tags=.git/tags;/
let g:easytags_dynamic_files = 1

" Ack find
map <c-f> :Ack<space>

" Debugging with gdb
function! GdbSlimuxBreakPoint()
    let a="SlimuxSendKeys "."'b ".expand('%:t').":".line(".")."\\n'"
    execute a
endfunction

let g:GdbSLimuxDebug_statusline_old = &statusline

let g:GdbSLimuxDebug_modeOn=0

function! ToggleGDBDebugMode()

    if(g:GdbSLimuxDebug_modeOn)
        " Switch debug mode off
        unmap bp
        unmap r
        unmap n
        unmap c
        unmap s
        unmap d
        unmap y
        unmap p
        echom 'GDB Debug Mode Off'
        let g:GdbSLimuxDebug_modeOn=0
        let &statusline = g:GdbSLimuxDebug_statusline_old
    else
        noremap bp :call GdbSlimuxBreakPoint()<cr>
        noremap r :SlimuxSendKeys 'run\n'<cr>
        noremap n :SlimuxSendKeys 'next\n'<cr>
        noremap c :SlimuxSendKeys 'cont\n'<cr>
        noremap s :SlimuxREPLSendLine<cr>
        noremap d :SlimuxSendKeys 'delete\n'<cr>:SlimuxSendKeys 'y\n'<cr>
        noremap y :SlimuxSendKeys 'y\n'<cr>
        noremap p :call GdbSlimuxPutVariable()<cr>
        echom 'GDB Debug Mode On'
        let g:GdbSLimuxDebug_modeOn=1
        let g:GdbSLimuxDebug_statusline_old=&statusline
        set statusline=%f
        set statusline+=\ [GDB\ MODE]
    endif

endfunction

function! GdbSlimuxPutVariable()
    normal! viw"ky
    execute "normal! :SlimuxSendKeys 'p ".@k."\\n'\<cr>"
endfunction

map <leader>gm call ToggleGDBDebugMode()

" yank function name
noremap <leader>yfn <esc>ma?subroutine<cr>wyiw`a
noremap L :tabnext<cr>
noremap H :tabprevious<cr>

" ignore object files and .git repos
set wildignore+=*.o
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|build|bin)$'

" Matlab editing
augroup matlabCmds
    autocmd!
    autocmd BufNewFile,BufRead *.m nnoremap <c-e> :SlimuxREPLSendLine<cr>
    autocmd BufNewFile,BufRead *.m inoremap <c-e> <esc>mz:SlimuxREPLSendLine<cr>`za
augroup END

" Easily Edit Tmux Config
nnoremap <leader>et :vsplit ~/.tmux.conf<cr>

" Ack find all calls to this function
function! AckFunctionCall()
    normal! 0wvt("ky
    execute "normal! :Ack! 'call.*".@k."'\<cr>"
endfunction
nnoremap <leader>fc :call AckFunctionCall()<cr>

"" My Fortran Runtime Plugin

let g:FRT_SourceDir='~/Source/maxwell-nefem/'
let g:FRT_OutFilePattern='outFileLog*'
let g:FRT_defaultOutWinSize = 10
let g:FRT_dataInpReference = '~/Source/maxwell-nefem/source/DGMaxwellTypes.f90'

" Takes as input the run directory and an optional source directory
function! FRTErrorList(...)

    " Setup input arguments
    let nOfArgs = len(a:000)

    let l:runpath = a:1
    if(nOfArgs>1)
        let g:sourceDir = a:2
    else
        let g:sourceDir = g:FRT_SourceDir
    endif

    " choose nsd based on run dir
    "'find ./ -name data.inp | xargs sed -n \'/inputData%nsd/s/.*=\s*//p\'
    let l:sysCmd = 'find '.l:runpath.' -name data.inp | xargs sed -n ''/inputData%nsd/s/.*=\s*//p'''
    let l:nsd = system(l:sysCmd)
    let l:nsd = substitute(split(l:nsd,'\v\n')[0],'\s*','','g')
    let l:FRT_BinPath = g:sourceDir.'/bin/debug/maxwell'.l:nsd.'D'

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
            unmap <buffer> <cr>
            unmap <buffer> v
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
    let s:FRT_filePath = split(system('find '.g:sourceDir.' -name '.l:FRT_fileName),'\v\n')[0]
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

" Shortcuts specific to Maxwell-nefem
map <localleader>dgmt :vsplit ./source/DGMaxwellTypes.f90<cr>

function! GotoCol(colnum)
    execute "normal! ".a:colnum."|"
endfunction

function! FortranAllocateRestructureLoop()
    call FortranAllocateRestructureNextFile()
    call FortranAllocateRestructure()
    write
endfunction

function! FortranAllocateRestructureNextFile()
    " find and open next allocate statement
    let sysout = split(system('ack --fortran ''^\s*allocate\('' | awk -F: ''{print $1 "\n" $2;exit}'''),'\v\n')
    let filename = sysout[0]
    let linenum = sysout[1]

    " edit filename
    execute "normal! :edit ".filename."\<cr>"
    " position cursor
    call cursor(linenum,1)
    " set word wrapping off
    setlocal textwidth=0
endfunction

function! FortranAllocateRestructure()
    " goto start of word
    normal! 0eb
    " Get subroutine info (exit if not in a subroutine)
    let s = FortranSubroutineInfo()
    if(s.startLine==0)
        echom 'NO SUBROUTINE'
        return 2
    endif
    " Get allocatable function string
    let cursorStart = col('.')
    let a = FortranFuncInfo()
    call GotoCol(a.arg_cols[0])
    let a = FortranFuncInfo()
    let nArgs = len(a.args)
    let t = FortranGetType()
    if t.type=~'double.*precision.*allocatable'
        let funcName = 'allocDbl'.nArgs.'D'
    elseif t.type=~'double.*precision.*pointer'
        let funcName = 'allocDblPointer'.nArgs.'D'
    elseif t.type=~'integer'
        let funcName = 'allocInt'.nArgs.'D'
    elseif t.type=~'logical'
        let funcName = 'allocLogical'.nArgs.'D'
    else
        echom 'ERRROR type '.t.type.' not known'
        return 1
    endif
    let funcArgs = [ a.name ] + a.args + [ "'".a.name."'" ] + [ "'".s.name."'" ]
    let args = "call ".funcName."(".join(funcArgs,',').")"
    call GotoCol(cursorStart)

    " Change allocatable string
    execute "normal! C".args

    " Go down one line
    normal! j
    " Remove all spaces
    " check if line starts with if(allocateStatus str
    normal! "kyy
    if(@k=~'if\s*(\s*allocateStatus')
        normal! dd
    endif
    return 0
endfunction

" Goto a line number
function! GotoLine(linenum)
    execute "normal! ".a:linenum."G"
endfunction

" Get the type of a variable (in the .type variable of structure)
function! FortranGetType()
    let l:winview = winsaveview()
    let currLine = line('.')

    " Get var name (word under cursor)
    normal! "kyiw
    let l:varName = @k

    " Search for declaration (between subrotine start and here)
    let l:s = FortranSubroutineInfo()
    call GotoLine(l:s.startLine)
    let declarationPosn = search('.*::.*\<'.l:varName.'\>','',currLine)
    normal! 0"kyt:

    let type = {}
    let type.topLevelType = @k
    let type.name = l:varName
    
    " If this is a declared variable look that variable up
    if type.topLevelType=~'^\s*type'
        let type.topLevelType = substitute(type.topLevelType,'^\s*type\s*(\s*','','')
        let type.topLevelType = substitute(type.topLevelType,').*','','')


        call winrestview(l:winview)

        let decomposedVariableName = FortranGetDecomposedVariableName()
        let decomposedVariableName[0] = type.topLevelType
    return decomposedVariableName

        let type.type = FortranLookupDerivedType(decomposedVariableName)
    else
        let type.type = type.topLevelType
    endif

    call winrestview(l:winview)
    return type
endfunction

function! PPList(myList)
    echom '[ '.join(a:myList,', ').' ]'
endfunction

function! PPStructVal(myStruct,val)
    echom '.'.a:val.' = '.a:myStruct[a:val]
endfunction

" Gets a list of derived types at the cursor e.g. mesh%parallelSolver(10)%nOfElement(1,35) -> [mesh, parallelSolver, nOfElements ]
" at the moment only works when the variable ends in ) or =... i.e. mesh%parallelSolver%nOfElements WONT work - but that is ok for finding allocatable variables
function! FortranGetDecomposedVariableName()
    let typeNames = []
    normal! mb
    while 1
        normal! ma
        " get current cursor posn
        let currPosn = col('.')

        " get cursor posn first %
        normal! `a
        normal! f%
        let percentPosn = col('.')

        " get cursor posn first (
        normal! `a
        normal! f(
        let bracketPosn = col('.')

        " get cursor posn first =
        normal! `a
        normal! f=
        let equalPosn = col('.')

        " get cursor posn first ,
        normal! `a
        normal! f,
        let commaPosn = col('.')

        " if there is next bracket set to a very high number
        if(bracketPosn==currPosn)
            let bracketPosn = 999
        endif

        if(percentPosn==currPosn)
            let percentPosn = 999
        endif
        
        " no more brackets or percentages - yank current word and return
        if(min([percentPosn,bracketPosn])==999)
            normal! `a
            normal! "kyw
            call add(typeNames, @k)
            break
        endif
        
        " if there is an = before the next % of ( - then end of variable, return
        if(equalPosn<min([ bracketPosn, percentPosn ]))
            normal! "kyt=
            call add(typeNames, @k)
            break
        endif

        " if there is a comma before the next % of ( - then end of variable, return
        if(commaPosn<min([ bracketPosn,percentPosn ]))
            normal! "kyt,
            " move to character after ,
            call add(typeNames, @k)
            break
        endif

        " move back to start
        normal! `a

        if(bracketPosn>percentPosn)
            " if bracket is BEFORE percent - yank until bracket
            normal! "kyt%
            " move to character after %
            normal! f%l
            call add(typeNames, @k)
        else
            " yank until (
            normal! "kyt(
            " move to character after bracket
            normal! f(%
            call add(typeNames, @k)

            " Check if there is a % after then )
            " if not, then this is the end of the variable - so return
            normal! l"kyl
            if(@k!='%')
                break
            endif
        endif

    endwhile
    normal! `b

    if(len(typeNames)==0)
        normal! "kyw
        let typeNames = [ @k ]
    endif

    return typeNames
endfunction

function! FortranLookupDerivedType(typeNames)
        let @k=''
        let l:newFileOpen = 0
        let l:winview = winsaveview()

        let typeType = substitute(a:typeNames[0],'\(type\s*(\|)\)','','g')

        " Look for type in this file
        let endType = search('^\s*end\s*type\s*'.typeType,'b')
        let startType = search('^\s*type\s*'.typeType,'b')

        " if no type in this file - look in DGMaxwellTypes file
        if(endType==0)
            vsplit ~/Source/maxwell-nefem/source/DGMaxwellTypes.f90
            let startType = 1
            let endType = line('$')
            let l:newFileOpen = 1
        endif

        let parentType=typeType

        for typeName in a:typeNames[1:]
            " place cursor at start
            call cursor(1,1)
            " find parent type bounds
            let startTypeParent = search('^\s*type\s*'.parentType)
            let endTypeParent = search('^\s*end\s*type\s*'.parentType)
            " place cursor inside parent type
            call cursor(startTypeParent+1,1)
            " search for child type in parent
            call search('^\s*.*::\s*'.typeName,'',endTypeParent)
            " get parent type name
            normal! ^"kyt:
            " remove all but type
            let parentType = @k
            if(parentType=~'^\s*type')
                let parentType = substitute(@k,'\(type\s*(\|).*\)','','g')
            else
                " If not a derived type, just break
                break
            endif
        endfor

        write
        if(l:newFileOpen == 1)
            quit
        endif

        call winrestview(l:winview)

        return parentType

endfunction

function! FortranSubroutineInfo()
    normal! mk
    let subInfo = {}
    let subInfo.startLine = search('^\s*subroutine','b')
    " go to start of 'subroutine word'
    normal! eb
    " yank word after subroutine until (
    normal! w"kyt(
    let subInfo.name = @k
    let subInfo.endLine = search('^\s*end\s*subroutine','')

    " If no subroutine around this...
    if(line('.') > subInfo.startLine && line('.') < subInfo.endLine)
        " Look for a function
        normal! `k
        let subInfo = {}
        let subInfo.startLine = search('^\s*function','b')
        normal! w"kyt(
        let subInfo.name = @k
        let subInfo.endLine = search('^\s*end\s*function','')

        " still no subroutine
        if(line('.') > subInfo.startLine && line('.') < subInfo.endLine)
            let subInfo.endLine = 0
            let subInfo.startLine = 0
            let subInfo.name = ''
        endif
    endif

    normal! `k

    return subInfo

endfunction

function! YankLineIntoTmpSplit()
    " put the contents in a new buffer
    let colNum = virtcol('.')
    normal! 0y$
    split __YankScratch__
    setlocal buftype=nofile
    normal! p0
    call GotoCol(colnum)
    return colNum
endfunction

" Cursor MUST be on first word, if its a structure
function! FortranFuncInfo()
    let l:func = {}

    let startCursor = col('.')
    normal! wb

    " Mark Start
    normal! ms

    while 1
        " move to next parenthesis
        normal! f(

        let startBracket = col('.')
        " Check that character after matching parenthesis isn't a %
        " ...jump to end parenthesis
        normal! %
        " ...store cursor posn, in case this is function end
        let endBracket = col('.')
        " ...check character to the right in case its a structure (unless its the end of a line)
        normal! l
        let @k=''
        normal! "kyl

        " if not another structure part (i.e. no %) AND not end of line
        " move back and record end position
        if( col('.') == (col('$') - 1) || @k!='%' )
            " if I'm at the end of the line the 'normal! l' above won't have made a difference...
            " so don't move back
            if(col('.')!=col('$')-1)
                normal h
            endif

            normal %
            " ... exit loop if this is the function, otherwise keep looping
            break
        endif
    endwhile
    
    " Mark Start
    normal! me

    let @k = ''
    normal! `s"ky`e
    let l:func.name = @k

    " Check if this is a structure index
    normal! l
    normal! "kyl
    if(@k=='%')
        echom 'this is a struct'
        return
    endif

    let l:func.args = []
    let l:func.arg_cols = []

    call GotoCol(startBracket)

    let moreArgs = 1
    normal! w
    while(moreArgs)
        normal! mk
        call add(l:func.arg_cols, col('.'))
        let moreArgs = FortranGotoNextCommaOnThisLevel(endBracket)
        "mark this place
        if(moreArgs)
            " move back one to avoid the comma
            normal! h
        endif
        " yank back to marker k into register k
        normal! v`k"ky
        let str = @k
        " trim leading/trailing spaces
        let str = substitute(str, '^\s*\(.\{-}\)\s*$', '\1', '')
        " add yanked argument to args array
        call add(l:func.args,str)
        " goto end of visual selection
        normal! `>
        " If there are more arguments skip the comma
        if(moreArgs)
            " skip to character after comma
            normal! ll
        endif
    endwhile

    call GotoCol(startCursor)

    normal! `s

    return l:func

endfunction

" Function that goes to the next end of argument (i.e. comma) - ignoring commas inside nested parenthesis. If no next comma is found the function goes to the end of the line. Returns true there are more arg after this one, false otherwise
function! FortranGotoNextCommaOnThisLevel(maxCol)
    while(1)
        " get character under cursor
        normal! "kyl

        if(col('.')>a:maxCol-2)
            return 0
        elseif(@k=='(')
            normal! %
        elseif(@k==',')
            return 1
        else
            normal! l
        endif
    endwhile
endfunction


function! DATFileRemapIndices()
    normal! ma
    normal! 0
    normal! w"kyiw
    let elemNum=@k
    let nodes=[]
    for x in [ 1, 2 ]
        normal! w"kyiw
        call add(nodes,@k)
    endfor
    let elemLine = search('^'.elemNum.' ','b')

    " skip over element and material
    let localNodes = [ -1, -1 ]
    for jNode in [ 0, 1 ]
        normal! 0ww
        for iNode in [ 1, 2, 3]
            " get word under cursor
            normal! "kyiw
            let currWord = @k
            if(currWord==nodes[jNode])
                let localNodes[jNode] = iNode
            endif
            normal! w
        endfor
    endfor
    echom '['.join(nodes,', ').'] -> ['.join(localNodes,', ').']'

    normal! `a0ww
    " replace node number
    for jNode in [ 0, 1 ]
        execute 'normal! cw'.localNodes[jNode]."\<esc>"
        normal! w
    endfor

    normal! j

endfunction

function! RefactorStiff()
    normal! 0w"kyt:
    let type = @k
    normal! $"kyF(
    let dimension = @k
    normal! $be"kyl
    let lastCharacter = @k
    let str = 'call print'
    if(type=~'double precision')
        let str = str.'Dbl'
    elseif(type=~'integer')
        let str = str.'Int'
    elseif(type=~'logical')
        let str = str.'Logical'
    elseif(type=~'double complex')
        let str = str.'DblComplex'
    elseif(type=~'character')
        let str = str.'Character'
    else
        echom 'ERROR - no type for '.type
        return
    endif

    let nsd = len(split(dimension,','))
    if(lastCharacter==')')
        let str = str.nsd.'D'
        normal! F(d$
    endif
    echom 'lastChar='.lastCharacter

    if(type=~'allocatable')
        let str = str.'Alloc'
    elseif(type=~'pointer')
        let str = str.'Pointer'
    endif

    normal! 02f:ll"ky$
    let variableName = g:varPrefix.@k
    let str=str.'(outFileDebug,'.variableName.','''.variableName.''')'

    normal! 0C
    execute 'normal! i'.str."\<esc>"
endfunction
