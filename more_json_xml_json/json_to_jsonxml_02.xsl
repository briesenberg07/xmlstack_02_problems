<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs math"
    expand-text="yes"
    version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:template match="/">
        <xsl:variable name="json" select=
            "unparsed-text('https://raw.githubusercontent.com/LD4P/sinopia_editor/main/static/authorityConfig.json')"/>
        <xsl:copy-of select="fn:json-to-xml($json)"></xsl:copy-of>
    </xsl:template>
</xsl:stylesheet>