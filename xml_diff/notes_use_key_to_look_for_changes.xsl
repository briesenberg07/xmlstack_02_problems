<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    expand-text="yes" version="3.0">
    <xsl:output method="html" indent="yes"/>
    
    <!-- reuse vars -->
    <xsl:include href="reuse_vars.xsl"/>
    
    <!-- key -->
    <xsl:key name="record_before_by_cdmnumber" match="record" use="cdmnumber"/>

    <xsl:template match="/">
        <metadata>
            <xsl:for-each select="
                    document(concat($raw_file_url_01, $after_sha, $raw_file_url_02))/metadata/record">
                <!-- still to do:
                iterate through target_fields, don't hard code fields in stylesheet as below -->
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
