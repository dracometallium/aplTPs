TEX:=$(wildcard *.tex)
TP_PDF:=$(TEX:.tex=.pdf)
AUX=$(TEX:.tex=.aux)
LOGOS:=$(wildcard logos/*.svg)
FIGURAS:=$(wildcard img/*.svg)
LOGOS_PDF=$(LOGOS:.svg=.pdf)
FIGURAS_PDF=$(FIGURAS:.svg=.pdf)
PDF=$(FIGURAS_PDF) $(LOGOS_PDF)
GARBAGE=*.aux *.bbl *.blg *.log *.pdf *.toc *.lof $(PDF) *.nav *.out *.snm

all: $(TP_PDF)

$(TP_PDF): %.pdf : %.tex apuntes-estilo.sty $(LOGOS_PDF) $(FIGURAS_PDF)
	pdflatex $^
	pdflatex $^



$(FIGURAS_PDF): %.pdf : %.svg
	inkscape $^ --batch-process --export-area-drawing  -o $@

$(LOGOS_PDF): %.pdf : %.svg
	inkscape $^ --batch-process --export-area-drawing  -o $@

clean:
	rm -f $(GARBAGE)
	rm -f $(PDF) $(DATOS)
