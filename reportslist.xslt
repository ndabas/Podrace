<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/podrace">
        <div class="contentTitle">
        Reports for <xsl:value-of select="title" />
        </div><br />
        <div>Select a date range:</div>
        <div>
            <table><tbody>
                <tr>
                <td>First date:</td>
                <td>Last date:</td>
                </tr>
                <tr>
                <td>
                <input type="text" id="inputFirstDate" style="width: 140px;" readonly="true" />
                <input type="hidden" id="valueFirstDate" value="0" />
                <button id="ButtonSelectFirstDate">
                <xsl:attribute name="onclick">var d = selectDate(parseInt(valueFirstDate.value)); if(d){var dt = new Date(d); dt.setHours(0, 0, 0, 0); d = dt.getTime(); valueFirstDate.value = d; inputFirstDate.value = formatDate(d);}</xsl:attribute>...</button>
                </td>
                <td>
                <input type="text" id="inputLastDate" style="width: 140px;" readonly="true" />
                <input type="hidden" id="valueLastDate" value="0" />
                <button id="ButtonSelectLastDate">
                <xsl:attribute name="onclick">var d = selectDate(parseInt(valueLastDate.value)); if(d){var dt = new Date(d); dt.setHours(23, 59, 59, 999); d = dt.getTime(); valueLastDate.value = d; inputLastDate.value = formatDate(d);}</xsl:attribute>...</button>
                </td>
                </tr>
            </tbody></table>
        <br /></div>
        <div>Select a category:</div>
        <xsl:for-each select="scores">
        <div><xsl:number />. <a href="#">
            <xsl:attribute name="onclick">data.displayXML(&apos;<xsl:value-of select="@href" />&apos;, &apos;report.xslt&apos;, {firstDate:valueFirstDate.value, lastDate:(valueLastDate.value != 0 ? valueLastDate.value : ((new Date()).getTime()))});</xsl:attribute>
            <xsl:value-of select="." /></a>
        </div>
        </xsl:for-each>
        </xsl:template>
</xsl:stylesheet>