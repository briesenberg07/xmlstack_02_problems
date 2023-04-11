<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    expand-text="1"
    version="3.0">
    
    <xsl:output method="xml" indent="1"/>
    
    <xsl:template match="/">
        <xsl:result-document href="process_desired_output.xml">
            <output>
                <xsl:for-each select="document('for_output.xml')/for_output/output">
                    <xsl:variable name="onematch" select="match_01"/>
                    <xsl:variable name="twomatch" select="match_02"/>
                    <xsl:variable name="threematch" select="match_03"/>
                    <xsl:variable name="sorted_props_all_nodes" as="node()*">
                        <xsl:for-each select="
                            (:just one doc so no fn_collection :)
                            document('source.xml')/set/prop
                            [implementation
                            [match_01 = $onematch]
                            [match_02 = $twomatch]
                            [match_03 = $threematch]]">
                            <xsl:sort select="
                                implementation
                                [match_01 = $onematch]
                                [match_02 = $twomatch]
                                [match_03 = $threematch]
                                /order"/>
                            <prop id="{@id}">
                                <label xml:lang="{@xml:lang}"/>
                                <xsl:copy-of select="
                                    implementation
                                    [match_01 = $onematch]
                                    [match_02 = $twomatch]
                                    [match_03 = $threematch]"/>
                            </prop>
                        </xsl:for-each>
                    </xsl:variable>
                    
                    <output_set id="{concat($onematch, $twomatch, $threematch)}">
                        <xsl:for-each select="$sorted_props_all_nodes">
                            <!-- using select="$sorted_props_all_nodes/prop" retrieves nothing... WHY? -->
                            <prop id="{@id}"/>
                            <implementations>{count(implementation)}</implementations>
                        </xsl:for-each>
                        <ref>
                            <xsl:copy-of select="$sorted_props_all_nodes"/>
                        </ref>
                    </output_set>
                    
                </xsl:for-each>
            </output>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>