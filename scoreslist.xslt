<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/podrace">
        <div class="contentTitle">
        Score categories for <xsl:value-of select="title" />
        </div><br />
        <xsl:for-each select="scores">
        <div><xsl:number />. <a href="#">
            <xsl:attribute name="onclick">data.displayXML(&apos;<xsl:value-of select="@href" />&apos;, &apos;scores.xslt&apos;);</xsl:attribute>
            <xsl:value-of select="." /></a>
        </div>
        </xsl:for-each>
        </xsl:template>
</xsl:stylesheet>