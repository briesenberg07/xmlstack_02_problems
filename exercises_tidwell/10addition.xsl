<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    version="1.0">
    <!-- From Ch. 3: Mathematical Operators -->
    <xsl:output method="text"/>    
    <xsl:template match="/">
        <xsl:text>Tests of addition in XPath 1.0&#xA;</xsl:text>
        <xsl:text>&#xA; 9 + 3 = </xsl:text>
        <xsl:value-of select="9+3"/>
        <xsl:text>&#xA; 9 + 3.8 = </xsl:text>
        <xsl:value-of select="9 + 3.8"/>
        <!-- XSLT 1.0 will convert the following strings to a number, if it can -->
        <xsl:text>&#xA; 9 + '4' = </xsl:text>
        <xsl:value-of select="9 + '4'"/>
        <xsl:text>&#xA; 9 + 'Q' = </xsl:text>
        <xsl:value-of select="9+'Q'"/>
        <!-- XSLT 1.0 will convert the following booleans to numeric vals 1 and 0 -->
        <xsl:text>&#xA; 9 + true() = </xsl:text>
        <xsl:value-of select="9+true()"/>
        <xsl:text>&#xA; 9 + false() = </xsl:text>
        <xsl:value-of select="9+false()"/>
    </xsl:template>
</xsl:stylesheet>