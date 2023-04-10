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

    <!-- ???
        Compare to ../001_nested_output/output_001.xml:
        I'm not getting the same number of properties in output... -->

    <xsl:template match="/">
        <xsl:variable name="all_output">
            <all_output>
                <xsl:for-each select="$rda_sets/mapstor:get_prop_sets/mapstor:get_set">
                    <xsl:variable name="set_source" select="mapstor:set_source"/>
                    <xsl:variable name="prop_iri" select="mapstor:use_prop"/>
                    <set set_name="{mapstor:set_name}">
                        <sinopia:hasPropertyUri rdf:resource="{$prop_iri}"/>
                        <xsl:for-each select="
                                document($set_source)/rdf:RDF/rdf:Description
                                [rdfs:subPropertyOf/@rdf:resource = $prop_iri]
                                [not(reg:status[@rdf:resource = 'http://metadataregistry.org/uri/RegStatus/1008'])]">
                            <xsl:element name="sinopia:hasPropertyUri">
                                <xsl:attribute name="rdf:resource">
                                    <xsl:value-of select="@rdf:about"/>
                                </xsl:attribute>
                            </xsl:element>
                            <xsl:call-template name="all_all_subprops">
                                <xsl:with-param name="set_source" select="$set_source"/>
                                <xsl:with-param name="prop_iri" select="@rdf:about"/>
                            </xsl:call-template>
                        </xsl:for-each>
                    </set>
                </xsl:for-each>
            </all_output>
        </xsl:variable>

        <xsl:result-document href="output_flat_distinct_01.xml">
            <!-- How to process results using distinct-values?? -->
            <xsl:variable name="distinct_values">
                <!-- Can I iterate on whatever it is that this gives me?? -->
                <xsl:value-of select="distinct-values($all_output//@rdf:resource)"/>
            </xsl:variable>
            <distinct-iris>
                <xsl:for-each select="tokenize($distinct_values)">
                    <iri>
                        <xsl:value-of select="."/>
                    </iri>
                </xsl:for-each>
            </distinct-iris>
        </xsl:result-document>
    </xsl:template>

    <xsl:template name="all_all_subprops">
        <xsl:param name="set_source"/>
        <xsl:param name="prop_iri"/>
        <sinopia:hasPropertyUri rdf:resource="{$prop_iri}"/>
        <xsl:for-each select="
                $set_source/rdf:RDF/rdf:Description
                [rdfs:subPropertyOf/@rdf:resource = $prop_iri]
                [not(reg:status[@rdf:resource = 'http://metadataregistry.org/uri/RegStatus/1008'])]">
            <xsl:element name="sinopia:hasPropertyUri">
                <xsl:attribute name="rdf:resource">
                    <xsl:value-of select="@rdf:about"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:call-template name="all_all_subprops">
                <xsl:with-param name="set_source" select="$set_source"/>
                <xsl:with-param name="prop_iri" select="@rdf:about"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
