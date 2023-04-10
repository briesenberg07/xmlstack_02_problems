<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="https://briesenberg07.github.io/xml_stack/"
    xmlns:mapstor="https://uwlib-cams.github.io/map_storage/xsd/"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:reg="http://metadataregistry.org/uri/profile/regap/"
    xmlns:sinopia="http://sinopia.io/vocabulary/" version="3.0">

    <xsl:output method="xml" indent="1"/>
    <xsl:variable name="rda_sets" select="document('../all_sets.xml')"/>

    <xsl:template match="/">
        <xsl:result-document href="output_nested_distinct_02.xml">
            <all_sets>
                <!--  -->
                <xsl:call-template name="for_prop_all_repeats">
                    <xsl:with-param name="prop_all_repeats" select="$prop_all_repeats"/>
                </xsl:call-template>
                <xsl:call-template name="for_prop_distinct">
                    <xsl:with-param name="prop_all_repeats" select="$prop_all_repeats"/>
                </xsl:call-template>
                <!--  -->
            </all_sets>
        </xsl:result-document>
    </xsl:template>

    <xsl:template name="for_prop_all_repeats">
        <xsl:param name="prop_all_repeats"/>
        <xsl:copy-of select="$prop_all_repeats"/>
    </xsl:template>

    <xsl:template name="for_prop_distinct">
        <xsl:param name="prop_all_repeats"/>
        <!--  -->
    </xsl:template>

    <xsl:template name="all_all_subprops">
        <xsl:param name="prop_set"/>
        <xsl:param name="prop_iri"/>
        <!--  -->
    </xsl:template>

</xsl:stylesheet>
