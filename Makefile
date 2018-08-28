PANDOCARGS=--listings -t latex


all: docs.pdf

docs.pdf: docs.tex section-setup.tex section-programming.tex section-simple.tex section-howto.tex section-m3pi-api.tex
	pdflatex docs.tex

section-%.tex: %.md
	pandoc $(PANDOCARGS) $< -o $@

.PHONY: clean
clean:
	rm -f *.pdf *.log *.aux *.out section-*.tex