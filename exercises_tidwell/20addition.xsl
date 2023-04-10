<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="2.0">
    <!-- From Ch. 3: Mathematical Operators -->
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:text>Tests of addition in XPath 2.0&#xA;</xsl:text>
        <xsl:text>&#xA; 9+3= </xsl:text>
        <xsl:value-of select="9+3"/>
        <xsl:text>&#xA; 9+3.8= </xsl:text>
        <xsl:value-of select="9+3.8"/>
        <!-- "[...] we explicitly cast each value to a number" -->
        <xsl:text>&#xA; 9 + number('4') = </xsl:text>
        <xsl:value-of select="9+number('4')"/>
        <xsl:text>&#xA; 9 + number('Q') = </xsl:text>
        <xsl:value-of select="9+number('Q')"/>
        <xsl:text>&#xA; 9 + number(true()) = </xsl:text>
        <xsl:value-of select="9+number(true())"/>
        <xsl:text>&#xA; 9 + number(false()) = </xsl:text>
        <xsl:value-of select="9+number(false())"/>
        <!-- Or we can use XSLT version 1.0?? 
            "The version attribute can be added to any XSLT element to specify that it should be processed as if it were in an XSLT 1.0 stylesheet" -->
        <xsl:text>&#xA; Or, we could do this:</xsl:text>
        <xsl:text>&#xA;&lt;xsl:value-of select="9+'4'" version="1.0"&gt; = </xsl:text>
        <xsl:value-of select="9+'4'" version="1.0"/>
        <xsl:text>&#xA;&lt;xsl:value-of select="9+false()" version="1.0"&gt; = </xsl:text>
        <xsl:value-of select="9+false()" version="1.0"/>
    </xsl:template>
</xsl:stylesheet>