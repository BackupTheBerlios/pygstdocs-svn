XSLFILES = \
xsl/common.xsl \
xsl/html.xsl \
xsl/ref-html-style.xsl \
xsl/tut-html-style.xsl \
xsl/pdf-style.xsl \
xsl/pdf.xsl \
xsl/devhelp.xsl

REFERENCEXMLFILES = \
src/ChangeLog.xml \
src/gst-classes.xml \
src/gst-hierarchy.xml \
src/gst-reference.xml \
src/gst-gstbin.xml \
src/gst-gstbus.xml \
src/gst-gstclock.xml \
src/gst-gstelement.xml \
src/gst-gstevent.xml \
src/gst-gstobject.xml \
src/gst-gstsystemclock.xml \
src/gst-gstpad.xml \
src/gst-gstghostpad.xml \
src/gst-gstminiobject.xml \
src/gst-gstpadtemplate.xml \
src/gst-gstbuffer.xml \
src/gst-gstbufferflag.xml \
src/gst-gstcaps.xml \
src/gst-gstpipeline.xml \
src/gst-gstquery.xml \
src/gst-gstmessage.xml \
src/gst-functions.xml \
src/gst-constants.xml

ref-html: gst-reference ${REFERENCELINKS} ${XSLFILES} ${REFERENCEXMLFILES}
	xsltproc --nonet --xinclude -o pygst-reference/ \
                 --stringparam gstdoc.bookname gst-reference \
                 --stringparam gstdoc.version 0.10 \
		xsl/ref-html-style.xsl src/gst-reference.xml
	cp pygst.css pygst-reference

ref-srcdist:
	tar czf pygst-reference.docbook.tar.gz ${REFERENCEXMLFILES} ${XSLFILES} \
		src/ChangeLog Makefile

ref-dist:
	tar czf pygst-reference.tar.gz pygst-reference

gst-reference:
	mkdir pygst-reference

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
	-rm -rf pygst-reference
	-rm -rf pygst-reference.tgz pygst-reference.docbook.tgz
