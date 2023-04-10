<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:mapstor="https://uwlib-cams.github.io/map_storage/xsd/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:reg="http://metadataregistry.org/uri/profile/regap/" exclude-result-prefixes="xs math"
    version="3.0">

    <xsl:output method="xml" indent="1"/>

    <xsl:variable name="rda_sets" select="document('../all_sets.xml')"/>

    <xsl:template match="/">
        <results>
            <xsl:for-each select="$rda_sets/mapstor:get_prop_sets/mapstor:get_set">
                <xsl:variable name="set_source" select="mapstor:set_source"/>
                <xsl:variable name="prop_iri" select="mapstor:use_prop"/>
                <set set_name="{mapstor:set_name}">
                    <prop
                        pno="{substring-after($prop_iri, 'http://rdaregistry.info/Elements/')}">
                        <xsl:value-of select="
                                $set_source/rdf:RDF/
                                rdf:Description[@rdf:about = $prop_iri]/rdfs:label[@xml:lang = 'en']"
                        />
                    </prop>
                    <xsl:for-each select="
                            $set_source/rdf:RDF/rdf:Description
                            [rdfs:subPropertyOf/@rdf:resource = $prop_iri]
                            [not(reg:status[@rdf:resource = 'http://metadataregistry.org/uri/RegStatus/1008'])]">
                        <subprop>
                            <xsl:call-template name="all_all_subprops">
                                <xsl:with-param name="set_source" select="$set_source"/>
                                <xsl:with-param name="prop_iri" select="@rdf:about"/>
                                <xsl:with-param name="prop_label"
                                    select="rdfs:label[@xml:lang = 'en']"/>
                            </xsl:call-template>
                        </subprop>
                    </xsl:for-each>
                </set>
            </xsl:for-each>
        </results>
    </xsl:template>

    <xsl:template name="all_all_subprops">
        <xsl:param name="set_source"/>
        <xsl:param name="prop_iri"/>
        <xsl:param name="prop_label"/>
        <prop pno="{substring-after($prop_iri, 'http://rdaregistry.info/Elements/w/')}">
            <xsl:value-of select="$prop_label"/>
        </prop>
        <xsl:for-each select="
                $set_source/rdf:RDF/rdf:Description
                [rdfs:subPropertyOf/@rdf:resource = $prop_iri]
                [not(reg:status[@rdf:resource = 'http://metadataregistry.org/uri/RegStatus/1008'])]">
            <subprop>
                <xsl:call-template name="all_all_subprops">
                    <xsl:with-param name="set_source" select="$set_source"/>
                    <xsl:with-param name="prop_iri" select="@rdf:about"/>
                    <xsl:with-param name="prop_label" select="rdfs:label[@xml:lang = 'en']"/>
                </xsl:call-template>
            </subprop>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
