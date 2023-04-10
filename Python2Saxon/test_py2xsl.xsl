<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" version="3.0">
<xsl:output method="xml" indent="true"/>
<xsl:param name="word"/>
<xsl:template match="/">
  <!-- we shall see *where* filepaths are evaluated *from* -->
  <!-- these filepaths are *also* evaluated from the location where the terminal is open where the Python script
  invoking the transformation is being run! -->
  <xsl:result-document href="test_py2xsl_out.xml">
    <output_a_param>
      <xsl:value-of select="$word"/>
    </output_a_param>
    </xsl:result-document>
    </xsl:template>
    </xsl:stylesheet>
