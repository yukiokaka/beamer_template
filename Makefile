TEX=$(shell ls *.tex)
PDF=$(TEX:.tex=.pdf)
DVI=$(TEX:.tex=.dvi)

PNG=$(shell ls *.png)
XBB=$(PNG:.png=.xbb)

all: compile
compile: xbb pdf
pdf: $(PDF)
PDF: $(DVI)
xbb: $(XBB)


%.pdf: %.dvi
	dvipdfmx $<
%.dvi: %.tex
	platex $<

%.xbb: %.png
	extractbb $<

clean:
	rm  -f *.aux *.bbl *.blg *.dvi *.out *.toc *.xbb *.pdf
