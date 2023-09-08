<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:template name="replace">
        <xsl:param name="pText" select="."/>
        <xsl:param name="pTarget"/>
        <xsl:param name="pReplace"/>
        
        <xsl:value-of select="substring-before(concat($pText, $pTarget), $pTarget)"/>
        <xsl:if test="contains($pText, $pTarget)">
            <xsl:value-of select="$pReplace"/>
            <xsl:call-template name="replace">
                <xsl:with-param name="pText"
                    select="substring-after($pText, $pTarget)"/>
                <xsl:with-param name="pTarget" select="$pTarget"/>
                <xsl:with-param name="pReplace" select="$pReplace"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>
        
</xsl:stylesheet>