XSLFILES = \
xsl/common.xsl \
xsl/html.xsl \
xsl/ref-html-style.xsl \
xsl/tut-html-style.xsl \
xsl/pdf-style.xsl \
xsl/pdf.xsl \
xsl/devhelp.xsl

TUTORIALXMLFILES = \
src/ChangeLog.xml \
src/gst-tutorial.xml \
src/gst-introduction.xml 

ref-html: gst-tutorial ${TUTORIALLINKS} ${XSLFILES} ${TUTORIALXMLFILES}
	xsltproc --nonet --xinclude -o gst-tutorial/ \
                 --stringparam gstdoc.bookname gst-tutorial \
                 --stringparam gstdoc.version 0.10 \
		xsl/ref-html-style.xsl src/gst-tutorial.xml

ref-srcdist:
	tar cjf gst-tutorial.docbook.tar.bz2 ${TUTORIALXMLFILES} ${XSLFILES} \
		src/ChangeLog Makefile

ref-dist:
	tar cjf gst-tutorial.tar.bz2 gst-tutorial

gst-tutorial:
	-mkdir gst-tutorial

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
	-rm -rf gst-tutorial
	-rm -rf gst-tutorial.tgz gst-tutorial.docbook.tgz
