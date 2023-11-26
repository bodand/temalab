.SUFFIXES: .tex .aux .pdf .pikchr .svg .tikz .png .eps
.DEFAULT_GOAL := build

XETEX ?= xetex
PIKCHR ?= pikchr
SVG2TIKZ ?= svg2tikz
MAGICK_CONVERT ?= magick convert

TEX := temalab.tex
PDF := ${TEX:.tex=.pdf}

DEPENDS = ${EXTRA_TEX} ${TIKZ} ${EPS}
include sources.mk

include common.mk
OBJDIR := ${CURDIR}/obj

.PHONY: depends
depends: ${DEPENDS}
	echo DEPENDS BUILT: ${DEPENDS}

.PHONY: build
build: ${OBJDIR}/.build depends ${PDF}

.SILENT:
${OBJDIR}/.build: GNUmakefile
	perl -MExtUtils::Command -e touch $@

