# common.mk -- 
#   Common build functionality that is make and system compatible.
#   Does not use, just POSIX make specific features, and system shell specific calls
#   latter of which is implemented using Perl, which should work:tm: on most 
#   platforms

${OBJDIR}/fonts/.build: Makefile
	perl "${CURDIR}/fonts.pl" "${CURDIR}" "${OBJDIR}"

.PHONY: clean
clean: 
	perl -MExtUtils::Command -e rm_rf ${OBJDIR}/*

.pikchr.svg:
	${PIKCHR} --svg-only ${CURDIR}/${<F} > ${OBJDIR}/${@F}

.svg.tikz:
	${SVG2TIKZ} --codeoutput figonly ${CURDIR}/${<F} > $@
	perl -i -pE 's/\\begin\{(.+?)\}/\\$$1/' $@
	perl -i -pE 's/\\end\{(.+?)\}/\\end$$1/' $@

.png.eps:
	${MAGICK_CONVERT} $< $@

.tex.pdf: 
	perl "${CURDIR}/copy_to_build.pl" "${CURDIR}" "${OBJDIR}" ${DEPENDS}
	${XETEX} -8bit -file-line-error -output-director=${OBJDIR} $< $@


