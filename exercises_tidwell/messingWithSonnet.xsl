<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:auth="http://www.authors.com/" 
    exclude-result-prefixes="xs" version="2.0">
    <xsl:template match="/">
        <xsl:text>&#xA;</xsl:text>
        <xsl:for-each select="//comment()">
            <xsl:value-of select="."/>
            <xsl:text>&#xA;</xsl:text>
        </xsl:for-each>
        <xsl:value-of select="/sonnet/auth:author/year-of-death - /sonnet/auth:author/year-of-birth"/>
    </xsl:template>
</xsl:stylesheet>
