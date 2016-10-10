#Macports, Ruby and miscellaneous scripts
export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/lib/bin/:$HOME/Source/maxwell-nefem/scripts:$HOME/Source/maxwell-nefem/python:$HOME/Source/maxwell-nefem/bin/debug:/opt/intel/compilers_and_libraries_2016.0.109/linux/bin/intel64:/opt/intel/compilers_and_libraries_2016.0.109/linux/mpi/intel64/bin:/opt/intel/debugger_2016/gdb/intel64_mic/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/lib/jvm/java-7-openjdk-amd64/bin"
# export MANPATH="/usr/local/man:$MANPATH"

export PATH=/opt/local/bin:/usr/local/bin:/opt/local/sbin:/usr/local/sbin:~/bin:$PATH

if [[ $OSTYPE == 'darwin'* ]] then
    export PATH=/usr/local/texlive/2015/bin/universal-darwin:/opt/local/libexec/gnubin/:$PATH
    . /opt/intel/composerxe/bin/compilervars.sh intel64  
else
    . /opt/intel/composer_xe_2013_sp1/bin/compilervars.sh intel64
    PATH="/opt/intel/composer_xe_2013_sp1.2.144/bin/intel64:${PATH}"
    alias open='xdg-open'
fi

export PATH="$HOME/Source/maxwell-nefem/scripts:$HOME/Source/maxwell-nefem/bin/debug:$PATH"

if [[ $OSTYPE == 'darwin'* ]] then
   # required for non system matlab python engine
   export DYLD_LIBRARY_PATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib:$DYLD_LIBRARY_PATH
fi
