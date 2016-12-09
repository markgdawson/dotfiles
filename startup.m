addpath ~/Source/maxwell-nefem/postprocessing
setpath

% reinitialize emacs path
fdir = dir(fullfile(getenv('HOME'),'.emacs.d','elpa','matlab-mode-*'));
if(~isempty(fdir))
    addpath(fullfile(getenv('HOME'),'.emacs.d','elpa',fdir.name, 'toolbox'),'-begin');
    emacsinit(fullfile(getenv('HOME'),'bin/ec'));
end
rehash;

set(0,'DefaultFigureWindowStyle','docked');
!synclient HorizTwoFingerScroll=0