.POSIX:
.SUFFIXES: .tex .aux .pdf .pikchr .svg .tikz .png .eps

XETEX ?= xetex
PIKCHR ?= pikchr
SVG2TIKZ ?= svg2tikz
MAGICK_CONVERT ?= magick convert

TEX := temalab.tex
PDF := ${TEX:.tex=.pdf}

DEPENDS = ${EXTRA_TEX} ${TIKZ} ${EPS}
.include "sources.mk"

.PHONY: build
build: ${.OBJDIR}/fonts/.build ${DEPENDS} ${PDF}

CURDIR := ${.CURDIR:Q}
OBJDIR := ${.OBJDIR:Q}
.include "common.mk"

