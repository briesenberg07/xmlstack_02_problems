<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    expand-text="yes" version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    <!-- reuse vars -->
    <xsl:include href="reuse_vars.xsl"/>

    <!-- TO DO ignore empty new field(s), or, get deprecated_values only where entered -->
    <xsl:variable name="ignore_empty_new">
        <xsl:sequence select="'deprecated_values'"/>
    </xsl:variable>

    <xsl:template match="/">
        <!--        <metadata>
            <xsl:for-each
                select="document(concat($raw_file_url_01, $before_sha, $raw_file_url_02))/metadata/record">
                <record>
                    <cdmnumber>{cdmnumber}</cdmnumber>
                        <xsl:call-template name="get_field_data">
                            <xsl:with-param name="record">
                                <xsl:copy-of select="."/>
                            </xsl:with-param>
                        </xsl:call-template>
                </record>
            </xsl:for-each>
        </metadata>-->
        
        <!--<get_info_01_results>
            <xsl:for-each select="$target_fields/field">
                <xsl:call-template name="get_info_01">
                    <xsl:with-param name="target_field" select="."/>
                </xsl:call-template>
            </xsl:for-each>
        </get_info_01_results>-->
        
        <!-- get_info_02 is most successful approach so far... BUT
        - Would prefer iterating through $target_fields, not using indexes
        - This does not include matching only where after != before
        - This does not include outputting deprecated_values only when values exist
        -->
        <get_info_02_results>
            <xsl:call-template name="get_info_02"/>
        </get_info_02_results>

    </xsl:template>

    <!--    <xsl:template name="get_field_data">
        <xsl:param name="record"/>
        <xsl:for-each select="$target_fields/field">
            <xsl:element name="{.}">{$record/*[local-name() = .]}</xsl:element>
        </xsl:for-each>
    </xsl:template>-->

    <xsl:template name="get_info_01">
        <xsl:param name="target_field"/>
        <xsl:for-each
            select="document(concat($raw_file_url_01, $before_sha, $raw_file_url_02))/metadata/record">
            <record>
                <cdmfilename>{cdmfilename}</cdmfilename>
                <xsl:element name="{$target_field}">{*[local-name() = $target_field]}</xsl:element>
            </record>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="get_info_02">
        <xsl:for-each select="document(concat($raw_file_url_01, $before_sha, $raw_file_url_02))/metadata/record">
            <record>
                <cdmnumber>{cdmnumber}</cdmnumber>
                <xsl:element name="{$target_fields/field[1]}">{*[local-name() = $target_fields/field[1]]}</xsl:element>
                <xsl:element name="{$target_fields/field[2]}">{*[local-name() = $target_fields/field[2]]}</xsl:element>
                <xsl:element name="{$target_fields/field[3]}">{*[local-name() = $target_fields/field[3]]}</xsl:element>
                <xsl:element name="{$target_fields/field[4]}">{*[local-name() = $target_fields/field[4]]}</xsl:element>
            </record>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
