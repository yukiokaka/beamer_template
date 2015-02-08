PROJECT=template

all: compile
compile: pdf
pdf: $(PROJECT).pdf

%.pdf: %.dvi
	dvipdfmx $<
%.dvi: %.tex
	platex $<

%.xbb: %.png
	extractbb $<

clean:
	rm  -f *.aux *.bbl *.blg *.dvi *.out *.toc  *.pdf
