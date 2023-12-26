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

        <xsl:result-document href="test_content_custom_xml_diff.html">
            <html>
                <head>
                    <title>CHANGE HISTORY: HARRIMAN</title>
                </head>
                <body>
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
                            <table>
                                <thead>
                                    <tr>
                                        <th colspan="2">item details here</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <xsl:if test="
                                            key('record_before_by_cdmnumber', cdmnumber,
                                            document(concat($raw_file_url_01, $before_sha, $raw_file_url_02)))/Title != Title">
                                        <tr>
                                            <th rowspan="3">Title</th>
                                        </tr>
                                        <tr>
                                            <td>{key('record_before_by_cdmnumber', cdmnumber, 
                                            document(concat($raw_file_url_01, $before_sha, $raw_file_url_02)))/Title}</td>
                                        </tr>
                                        <tr>
                                            <td>{Title}</td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="
                                        key('record_before_by_cdmnumber', cdmnumber,
                                        document(concat($raw_file_url_01, $before_sha, $raw_file_url_02)))/Notes != Notes">
                                        <tr>
                                            <th rowspan="3">Notes</th>
                                        </tr>
                                        <tr>
                                            <td>{key('record_before_by_cdmnumber', cdmnumber, 
                                                document(concat($raw_file_url_01, $before_sha, $raw_file_url_02)))/Notes}</td>
                                        </tr>
                                        <tr>
                                            <td>{Notes}</td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="
                                        key('record_before_by_cdmnumber', cdmnumber,
                                        document(concat($raw_file_url_01, $before_sha, $raw_file_url_02)))/SubjectsLCSH != SubjectsLCSH">
                                        <tr>
                                            <th rowspan="3">Subjects (LCSH)</th>
                                        </tr>
                                        <tr>
                                            <td>{key('record_before_by_cdmnumber', cdmnumber, 
                                                document(concat($raw_file_url_01, $before_sha, $raw_file_url_02)))/SubjectsLCSH}</td>
                                        </tr>
                                        <tr>
                                            <td>{SubjectsLCSH}</td>
                                        </tr>
                                    </xsl:if>
                                    <xsl:if test="
                                        key('record_before_by_cdmnumber', cdmnumber,
                                        document(concat($raw_file_url_01, $before_sha, $raw_file_url_02)))/LocationDepicted != LocationDepicted">
                                        <tr>
                                            <th rowspan="3">Location Depicted</th>
                                        </tr>
                                        <tr>
                                            <td>{key('record_before_by_cdmnumber', cdmnumber, 
                                                document(concat($raw_file_url_01, $before_sha, $raw_file_url_02)))/LocationDepicted}</td>
                                        </tr>
                                        <tr>
                                            <td>{LocationDepicted}</td>
                                        </tr>
                                    </xsl:if>
                                </tbody>
                            </table>
                        </xsl:if>
                    </xsl:for-each>
                </body>
            </html>
        </xsl:result-document>

    </xsl:template>

</xsl:stylesheet>
