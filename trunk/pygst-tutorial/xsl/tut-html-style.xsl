<?xml version='1.0'?> <!--*- mode: xml -*-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		version='1.0'>
<xsl:import href="http://docbook.sourceforge.net/release/xsl/current/html/chunk.xsl"/>
<xsl:include href="common.xsl"/>
<xsl:include href="html.xsl"/>
<xsl:include href="devhelp.xsl"/>
 
<xsl:param name="section.autolabel" select="1"/>
<xsl:param name="section.label.includes.component.label" select="1"/>
<xsl:param name="highlight.source" select="1"/>

 <xsl:template match="book|article">
    <xsl:apply-imports/>
    <xsl:call-template name="generate.devhelp"/>
  </xsl:template>
 
</xsl:stylesheet>
