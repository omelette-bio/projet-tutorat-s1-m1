all: build

build:
	pdflatex rapport_francois_flandin.tex
	bibtex rapport_francois_flandin.aux
	pdflatex rapport_francois_flandin.tex
	pdflatex rapport_francois_flandin.tex

clean:
	rm *.{aux,toc,out,log}
