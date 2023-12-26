<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <!-- assemble URLs for XML file at before/after commit-->
    <xsl:variable name="raw_file_url_01" select="'https://github.com/uwlib-mig/critcat/raw/'"/>
    <xsl:variable name="before_sha" select="'6d42ca93fe04fab025626e931640e243166bd77d'"/>
    <xsl:variable name="after_sha" select="'e41f0467527c1a28a3b9b5d6dc52490f1cef79ff'"/>
    <xsl:variable name="raw_file_url_02"
        select="'/Past_Projects/Harriman/CONTENTdm_custom_harriman.xml'"/>
    
    <!-- assemble CONTENTdm item URLs? -->
    <xsl:variable name="item_url_prefix">https://digitalcollections.lib.washington.edu/digital/collection/harriman/id/</xsl:variable>
    
    <!-- TO DO: iterate through target field(s) for diff -->
    <xsl:variable name="target_fields">
        <field>Title</field>
        <field>Notes</field>
        <field>SubjectsLCSH</field>
        <field>LocationDepicted</field>
    </xsl:variable>
    
    <!-- TO DO ignore empty new field(s), or, get deprecated_values only where entered -->
    <xsl:variable name="ignore_empty_new">
        <xsl:sequence select="'deprecated_values'"/>
    </xsl:variable>
    
</xsl:stylesheet>