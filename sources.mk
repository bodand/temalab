# sources.mk --
#   List of sources other than the main temalab.tex file.

EXTRA_TEX := bodand.tex bodand-coloring.tex hyp.tex tokyo-night.day.tex
PIKS := chunked_list.pikchr
IMGS := bad_chunking.png

# trickery 
AUX := ${TEX:.tex=.aux}
SVG := ${PIKS:.pikchr=.svg}
TIKZ := ${SVG:.svg=.tikz}
EPS := ${IMGS:.png=.eps}
