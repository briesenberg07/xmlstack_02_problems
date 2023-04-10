<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:reg="http://metadataregistry.org/uri/profile/regap/"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xml" indent="1"/>

    <xsl:param name="work_prop_iri" select="'http://rdaregistry.info/Elements/w/P10307'"/>

    <xsl:variable name="work_props"
        select="document('https://github.com/RDARegistry/RDA-Vocabularies/raw/master/xml/Elements/w.xml')"/>

    <xsl:template match="/">
        <xsl:param name="work_prop_iri" select="$work_prop_iri"/>
        <results>
            <prop pno="{substring-after($work_prop_iri, 'http://rdaregistry.info/Elements/w/')}">
                <xsl:value-of select="
                        $work_props/rdf:RDF/
                        rdf:Description[@rdf:about = $work_prop_iri]/rdfs:label[@xml:lang = 'en']"
                />
            </prop>
            <xsl:for-each
                select="$work_props/rdf:RDF/rdf:Description
                [rdfs:subPropertyOf/@rdf:resource = $work_prop_iri]
                [not(reg:status[@rdf:resource = 'http://metadataregistry.org/uri/RegStatus/1008'])]">
                <subprop>
                    <xsl:call-template name="all_all_subprops">
                        <xsl:with-param name="work_props" select="$work_props"/>
                        <xsl:with-param name="prop_iri" select="@rdf:about"/>
                        <xsl:with-param name="prop_label" select="rdfs:label[@xml:lang = 'en']"/>
                    </xsl:call-template>
                </subprop>
            </xsl:for-each>
        </results>
    </xsl:template>

    <xsl:template name="all_all_subprops">
        <xsl:param name="work_props"/>
        <xsl:param name="prop_iri"/>
        <xsl:param name="prop_label"/>
        <prop pno="{substring-after($prop_iri, 'http://rdaregistry.info/Elements/w/')}">
            <xsl:value-of select="$prop_label"/>
        </prop>
        <xsl:for-each
            select="$work_props/rdf:RDF/rdf:Description
            [rdfs:subPropertyOf/@rdf:resource = $prop_iri]
            [not(reg:status[@rdf:resource = 'http://metadataregistry.org/uri/RegStatus/1008'])]">
            <subprop>
                <xsl:call-template name="all_all_subprops">
                    <xsl:with-param name="work_props" select="$work_props"/>
                    <xsl:with-param name="prop_iri" select="@rdf:about"/>
                    <xsl:with-param name="prop_label" select="rdfs:label[@xml:lang = 'en']"/>
                </xsl:call-template>
            </subprop>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
