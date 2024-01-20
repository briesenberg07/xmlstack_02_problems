<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <!-- Example XSLT stylesheet 
    see https://chat.openai.com/share/a7054c6b-54c6-474d-b3a6-2031c515bf19
    ... is this gibberish? Or, do I just really not understand it!? -->
    <xsl:param name="elementsList" />
    
    <xsl:template match="/">
        <xsl:apply-templates select="metadata/record" />
    </xsl:template>
    
    <xsl:template match="record">
        <xsl:variable name="recordId" select="generate-id()" />
        <xsl:variable name="beforeRecord" select="document('before.xml')//record[generate-id() = $recordId]" />
        <xsl:variable name="afterRecord" select="document('after.xml')//record[generate-id() = $recordId]" />
        
        <xsl:for-each select="$elementsList">
            <xsl:variable name="elementName" select="." />
            <xsl:variable name="beforeValue" select="$beforeRecord/*[name() = $elementName]" />
            <xsl:variable name="afterValue" select="$afterRecord/*[name() = $elementName]" />
            
            <xsl:if test="$beforeValue != $afterValue">
                <xsl:text>Element: </xsl:text>
                <xsl:value-of select="$elementName" />
                <xsl:text>&#10;Before: </xsl:text>
                <xsl:value-of select="$beforeValue" />
                <xsl:text>&#10;After: </xsl:text>
                <xsl:value-of select="$afterValue" />
                <xsl:text>&#10;&#10;</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    
</xsl:stylesheet>