##
# Compiling Analysis Papers
#

PAPER ?= paper

all: $(PAPER).pdf

$(PAPER).pdf: $(PAPER).tex bibliography.bib
	pdflatex $(PAPER).tex
	bibtex $(PAPER)
	pdflatex $(PAPER).tex
	pdflatex $(PAPER).tex

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc

distclean: clean
	rm -f *.pdf

# end
