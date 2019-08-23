<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output method="text" encoding="utf-8"/>

  <xsl:variable name="apos">&apos;</xsl:variable>
  <xsl:variable name="quot">&quot;</xsl:variable>
  <xsl:variable name="nl" select="'&#xa;&#xd;'" />

  <xsl:template match="root">
    <xsl:text>Demonstration of a Multiple Value-parsing Template.</xsl:text>
    <xsl:apply-templates select="example" />
  </xsl:template>

  <xsl:template match="example">
    <xsl:value-of select="concat($nl, 'Showing parsing of ', $apos, @value, $apos, $nl)" />
    <xsl:if test="@delimiter">
      <xsl:value-of select="concat('Using alternative delimiter ', $apos, @delimiter, $apos, $nl)" />
    </xsl:if>

    <xsl:variable name="defdel"
                  select="substring(',', 1 div boolean(0=string-length(@delimiter)))" />

    <xsl:call-template name="parse_csv">
      <xsl:with-param name="str" select="@value" />
      <xsl:with-param name="delimiter" select="concat(@delimiter,$defdel)" />
    </xsl:call-template>
  </xsl:template>


  <xsl:template name="parse_csv">
    <xsl:param name="str" />
    <xsl:param name="delimiter" select="','" />

    <xsl:variable name="before" select="substring-before($str,$delimiter)" />
    <xsl:variable name="blen" select="string-length($before)" />

    <!-- Compact conditional string selection: -->
    <xsl:variable name="backup" select="substring($str, 1 div boolean($blen=0))" />
    <xsl:variable name="val" select="concat($before, $backup)" />

    <!-- Using the value is not part of the demonstration, hand it off: -->
    <xsl:call-template name="use_csv_value">
      <xsl:with-param name="val" select="$val" />
    </xsl:call-template>

    <!-- recurse if more values remain to be parsed. -->
    <xsl:if test="not($blen=0)">
      <xsl:call-template name="parse_csv">
        <xsl:with-param name="str" select="substring-after($str,$delimiter)" />
        <xsl:with-param name="delimiter" select="$delimiter" />
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template name="use_csv_value">
    <xsl:param name="val" />
    <xsl:value-of select="concat($val,$nl)" />
  </xsl:template>

</xsl:stylesheet>
