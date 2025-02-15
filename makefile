all: noindex withindex 

noindex:
	pandoc --listings -s -F pandoc-crossref --citeproc --template=orangelegrand.latex --top-level-division=part --bibliography bibliography.bib  example_noindex.md  -o dist/example_noindex.pdf 

withindex:
	pandoc --listings -s -F pandoc-crossref --citeproc --template=orangelegrand.latex --top-level-division=part --bibliography bibliography.bib  example_noindex.md example.md  -o example.tex 
	pdflatex example
	makeindex example.idx -s StyleInd.ist
	pdflatex example
	# biber example
	# pdflatex example
	# pdflatex example
	mv example.pdf dist/example.pdf

clean:
	rm -f *.aux
	rm -f *.bcf
	rm -f *.idx
	rm -f *.ilg
	rm -f *.ind
	rm -f *.log
	rm -f *.ptc
	rm -f *.run.xml
	rm -f *.toc
