<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:output method="text"/>
 <xsl:variable name="vS" select="/*"/>
  
  <!-- TESTING -->
  <xsl:variable name="text" select="'violin viola trumpet trombone etc'"/>
  <xsl:variable name="target1" select="'fiddle'"/>
  <xsl:variable name="target2" select="'trombone'"/>

 <xsl:template match="/*">
   <!-- TESTING -->
   <xsl:value-of select="substring-before(concat($text, $target1), $target1)"/>
   '<xsl:call-template name="replace">
     <xsl:with-param name="pTarget" select="'cat'"/>
     <xsl:with-param name="pRep" select="'tiger'"/>
    </xsl:call-template>'
   '<xsl:call-template name="replace">
     <xsl:with-param name="pTarget" select="'rat'"/>
     <xsl:with-param name="pRep" select="'capybara'"/>
   </xsl:call-template>'
   <xsl:value-of select="substring-before(concat($text, $target2), $target2)"/>
 </xsl:template>
 
 <xsl:template name="replace">
   <xsl:param name="pText" select="."/>
   <xsl:param name="pTarget"/>
   <xsl:param name="pRep"/>
   
   <!-- per instructor, this template works even if pText does not contain pTarget... see TESTING -->
   <xsl:value-of select=
   "substring-before(concat($pText,$pTarget), $pTarget)"/>
   <xsl:if test="contains($pText,$pTarget)">
     <xsl:value-of select="$pRep"/>
     <xsl:call-template name="replace">
       <xsl:with-param name="pText"
        select="substring-after($pText,$pTarget)"/>
       <xsl:with-param name="pTarget" select="$pTarget"/>
       <xsl:with-param name="pRep" select="$pRep"/>
     </xsl:call-template>
   </xsl:if>
 </xsl:template>
</xsl:stylesheet>