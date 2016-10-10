$pdflatex = 'pdflatex -interaction=nonstopmode --shell-escape -synctex=1 %O %S';
$pdf_previewer = 'open -a skim';
$clean_ext = 'bbl rel %R-blx.bib %R.synctex.gz';


### Custom dependencies
# Build pdf with pdflatex
$pdf_mode = 1;

# Additional options for pdflatex
$pdflatex = "pdflatex -shell-escape %O %S";

# Use pdflatex recorder functionality
$recorder = 1;

# fig -> pdf
add_cus_dep('fig', 'pdf', 0, 'fig2pdf');
sub fig2pdf {
    system("matlabfig2pdf.py \"$_[0].fig\""); 
}

# .m -> pdf (*.m file should generate pdf
add_cus_dep('m', 'pdf', 0, 'm2pdf');
sub m2pdf {
    system("matlabscript2pdf.py \"$_[0].m\""); 
}

# example
#system("dot -Tpdf \"$_[0].dot\" > \"$_[0].pdf\"");

### End Custom dependencies