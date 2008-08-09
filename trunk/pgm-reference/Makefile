XSLFILES = \
xsl/common.xsl \
xsl/html.xsl \
xsl/ref-html-style.xsl \
xsl/pdf-style.xsl \
xsl/pdf.xsl \
xsl/devhelp.xsl

REFERENCEXMLFILES = \
src/ChangeLog.xml \
src/pgm-classes.xml \
src/pgm-hierarchy.xml \
src/pgm-reference.xml \
src/pgm-functions.xml \
src/pgm-constants.xml \
src/pgm-pgmcanvas.xml

ref-html: pgm-reference ${REFERENCELINKS} ${XSLFILES} ${REFERENCEXMLFILES}
	xsltproc --nonet --xinclude -o pgm-reference/ \
    --stringparam pgmdoc.bookname pgm-reference \
    --stringparam pgmdoc.version 0.3 \
      xsl/ref-html-style.xsl src/pgm-reference.xml
	cp var/* pgm-reference

ref-srcdist:
	tar czf pgm-reference.docbook.tar.gz ${REFERENCEXMLFILES} ${XSLFILES} \
    src/ChangeLog Makefile

ref-dist:
	tar czf pgm-reference.tar.gz pgm-reference

pgm-reference:
	mkdir pgm-reference

src/ChangeLog.xml: src/ChangeLog
	(echo '<literallayout>'; \
  sed \
    -e 's/&/\&amp;/g' \
    -e 's/</\&lt;/g' \
    -e 's/>/\&gt;/g' \
    -e 's/^	\* \([^ ]*\) \(.*\)$$/	* <filename>\1<\/filename> \2/' \
    -e 's/	/        /' \
    -e '/^20[0-9][0-9]-[0-9][0-9]-.*$$/s/^\(.*\)$$/<emphasis role="bold">\1<\/emphasis>/' \
    -e 's/(\([^)]*\))/(<emphasis>\1<\/emphasis>)/g' \
    src/ChangeLog; \
    echo '</literallayout>') \
  > src/ChangeLog.xml

clean:
	-rm -rf pgm-reference
	-rm -rf pgm-reference.tgz pgm-reference.docbook.tgz

