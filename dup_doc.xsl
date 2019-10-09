<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output
      method="xml"
      version="1.0"
      indent="yes"
      omit-xml-declaration="yes"
      encoding="utf-8"/>

  <xsl:variable name="nl" select="'&#xa;'" />

  <xsl:template match="/">
    <xsl:apply-templates select="/" mode="copyxml" />
  </xsl:template>

  <!--
      This single element is sufficient to copy any contents.
      Simple select something and apply this template to copy
      all the child items, from elements and attributes, to 
      text content, to processing-instructions (PIs) and comments.
  -->

  <xsl:template match="@*|node()" mode="copyxml">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()" mode="copyxml" />
    </xsl:copy>
  </xsl:template>

  <!--
      The following two templates, if un-commented, will prevent
      copying of XML items of the respective *match*.  That is,
      given the generic copy-all template above, uncomment the
      *processing-instruction()* template to prevent copying of
      any processing instructions.
  -->

  <!-- <xsl:template match="processing-instruction()" mode="copyxml"></xsl:template> -->
  <!-- <xsl:template match="comment()" mode="copyxml"></xsl:template> -->

  <!--
      If you want to copy only one specific processing-instruction,
      *xml-stylesheet* for example, you need to recognize it and
      duplicate it.

      To copy ONLY the *xml-stylesheet* instruction, uncomment the
      processing-instruction filter above to match and ignore generic
      PIs, the uncomment the specific *xml-stylesheet* PI following
      the generic.
  -->

  <!--
      processing-instructions can be matched by name (inside the
      parentheses) or position within its context ( by a number
      enclosed in square brackets).
  -->

  <!-- <xsl:template match="processing-instruction('xml-stylesheet')" mode="copyxml"> -->
  <!--   <xsl:processing-instruction name="{local-name()}"> -->
  <!--     <xsl:value-of select="concat('xs', .)" /> -->
  <!--   </xsl:processing-instruction> -->
  <!--   <xsl:value-of select="$nl" /> -->
  <!-- </xsl:template> -->

  <!-- Comments can be recognized by position (parentage), and then ignored. -->

  <!-- <xsl:template match="collection/comment()" mode="copyxml"></xsl:template> -->
  <!-- <xsl:template match="/comment()" mode="copyxml"></xsl:template> -->


  <!-- Remove all comments except one matched in the xsl:if statement. -->

  <!-- <xsl:template match="comment()" mode="copyxml"> -->
  <!--   <xsl:if test="contains(., 'item-contained')"> -->
  <!--     <xsl:comment><xsl:value-of select="." /></xsl:comment> -->
  <!--   </xsl:if> -->
  <!-- </xsl:template> -->



</xsl:stylesheet>
