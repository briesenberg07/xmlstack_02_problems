<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    expand-text="yes" version="3.0">
    <xsl:output method="xml" indent="yes"/>

    <!-- reuse vars -->
    <xsl:include href="reuse_vars.xsl"/>

    <xsl:template match="/">
        <metadata>
            <!--<xsl:for-each
                select="document(concat($raw_file_url_01, $before_sha, $raw_file_url_02))/metadata/record">
                <record>
                    <cdmnumber>{cdmnumber}</cdmnumber>
                    <xsl:call-template name="get_field_data">
                        <xsl:with-param name="record">
                            <xsl:copy-of select="."/>
                        </xsl:with-param>
                    </xsl:call-template>
                </record>
            </xsl:for-each>-->
            <!--<get_info_01_results>
            <xsl:for-each select="$target_fields/field">
                <xsl:call-template name="get_info_01">
                    <xsl:with-param name="target_field" select="."/>
                </xsl:call-template>
            </xsl:for-each>
        </get_info_01_results>-->
            <!-- get_info_02 is only success so far matching element with variable value!
                ... BUT still want to:
                - iterate through $target_fields (not use index as here)
                - match + output only where after != before (see notes on key use)
                - output deprecated_values only when values exist after
                -->
            <get_info_02_results>
                <xsl:call-template name="get_info_02"/>
            </get_info_02_results>
            <!--<get_info_03_results>
            <xsl:call-template name="get_info_03">
                <xsl:with-param name="metadata" select="document(concat($raw_file_url_01, $before_sha, $raw_file_url_02))/metadata"/>
            </xsl:call-template>
        </get_info_03_results>-->
        </metadata>
    </xsl:template>

    <xsl:template name="get_field_data">
        <xsl:param name="record"/>
        <xsl:for-each select="$target_fields/field">
            <xsl:element name="{.}">{$record/*[local-name() = .]}</xsl:element>
        </xsl:for-each>
    </xsl:template>
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
        <xsl:for-each
            select="document(concat($raw_file_url_01, $before_sha, $raw_file_url_02))/metadata/record">
            <record>
                <cdmnumber>{cdmnumber}</cdmnumber>
                <xsl:element name="{$target_fields/field[1]}"
                    >{*[local-name() = $target_fields/field[1]]}</xsl:element>
                <xsl:element name="{$target_fields/field[2]}"
                    >{*[local-name() = $target_fields/field[2]]}</xsl:element>
                <xsl:element name="{$target_fields/field[3]}"
                    >{*[local-name() = $target_fields/field[3]]}</xsl:element>
                <xsl:element name="{$target_fields/field[4]}"
                    >{*[local-name() = $target_fields/field[4]]}</xsl:element>
            </record>
        </xsl:for-each>
    </xsl:template>
    <xsl:template name="get_info_03">
        <xsl:param name="metadata"/>
        <xsl:for-each select="$metadata/record">
            <record>
                <xsl:for-each select="$target_fields/field">
                    <xsl:element name="{.}">{$metadata/record/*[local-name() = .]}</xsl:element>
                </xsl:for-each>
            </record>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
