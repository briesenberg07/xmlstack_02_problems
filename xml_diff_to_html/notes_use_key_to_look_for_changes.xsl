<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    expand-text="yes" version="3.0">
    <xsl:output method="html" indent="yes"/>

    <!-- assemble URLs for XML file at before/after commit-->
    <xsl:variable name="raw_file_url_01" select="'https://github.com/uwlib-mig/critcat/raw/'"/>
    <xsl:variable name="before_sha" select="'6d42ca93fe04fab025626e931640e243166bd77d'"/>
    <xsl:variable name="after_sha" select="'e41f0467527c1a28a3b9b5d6dc52490f1cef79ff'"/>
    <xsl:variable name="raw_file_url_02"
        select="'/Past_Projects/Harriman/CONTENTdm_custom_harriman.xml'"/>

    <!-- key -->
    <xsl:key name="record_before_by_cdmnumber" match="record" use="cdmnumber"/>

    <!-- possible to assemble CONTENTdm item URLs? -->
    <xsl:variable name="item_url_prefix">https://digitalcollections.lib.washington.edu/digital/collection/harriman/id/</xsl:variable>

    <xsl:template match="/">
        <metadata>
            <xsl:for-each select="
                    document(concat($raw_file_url_01, $after_sha, $raw_file_url_02))/metadata/record">
                <xsl:if test="
                        key('record_before_by_cdmnumber', cdmnumber,
                        document(concat($raw_file_url_01, $before_sha, $raw_file_url_02)))/Title != Title
                        or
                        key('record_before_by_cdmnumber', cdmnumber,
                        document(concat($raw_file_url_01, $before_sha, $raw_file_url_02)))/Notes != Notes
                        or
                        key('record_before_by_cdmnumber', cdmnumber,
                        document(concat($raw_file_url_01, $before_sha, $raw_file_url_02)))/SubjectsLCSH != SubjectsLCSH
                        or
                        key('record_before_by_cdmnumber', cdmnumber,
                        document(concat($raw_file_url_01, $before_sha, $raw_file_url_02)))/LocationDepicted != LocationDepicted">
                    <updated_record url="{concat($item_url_prefix, cdmnumber)}"/>
                    <!-- BONUS how to count updated records?? -->
                </xsl:if>
            </xsl:for-each>

        </metadata>
    </xsl:template>

</xsl:stylesheet>
