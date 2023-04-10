<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xmlstack="https://briesenberg07.github.io/xml_stack/"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xml" indent="1"/>
    <xsl:template match="/">
        
        <xsl:variable name="output_01">
            <xsl:sequence 
                select="let $transform := transform(
                map {
                'stylesheet-location': 'get_rda_all_all_subproperties_nested_02.xsl',
                'source-node': document('get_rda_all_all_subproperties_nested_02.xsl')
                })
                return $transform?output"/>
        </xsl:variable>
        
        <xsl:variable name="output_02">
            <xsl:sequence 
                select="let $transform := transform(
                map {
                'stylesheet-location': 'count_nested.xsl',
                'source-node': $output_01
                })
                return $transform?output"/>
        </xsl:variable>
        
        <xsl:result-document href="output_nested_02.xml">
            <xsl:sequence select="$output_02"/>
        </xsl:result-document>
        
    </xsl:template>    
    
</xsl:stylesheet>