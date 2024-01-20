<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs fn" 
    expand-text="yes"
    version="3.0">
    <xsl:output method="xml" indent="1"/>
    
    <xsl:variable name="uwsinopia_schema" select=
        "fn:doc('https://uwlib-cams.github.io/sinopia_maps/xsd/uwsinopia.xsd')"/>
    <xsl:variable name="qa_sources" select=
        "fn:json-to-xml(unparsed-text('https://raw.githubusercontent.com/LD4P/sinopia_editor/main/static/authorityConfig.json'))"/>
    <!-- TEST <xsl:template match="/"><xsl:copy-of select="$qa_sources"/></xsl:template> -->
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="$uwsinopia_schema//xs:simpleType[@name = 'authority_urn_type']">
        <xs:simpleType name="authority_urn_type">
            <xs:restriction base="xs:string">
                <xsl:for-each select="$qa_sources/fn:array/fn:map">
                    <xs:enumeration value="{fn:string[@key = 'label']}"/>
                </xsl:for-each>
            </xs:restriction>
        </xs:simpleType>
    </xsl:template>

</xsl:stylesheet>
