<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/events">
        <div class="contentTitle">
            <xsl:value-of select="title" />
        </div>
        <table id="TableData" onrowselect="return TableData_onRowSelect();" cellpadding="2" cellspacing="1" style="behavior: url(tablehl.htc); cursor: hand;" hlstyle="background-color:#c1d2ee;" slstyle="background-color:#316ac5;color:#ffffff;">
            <thead>
                <tr><th>Event name</th></tr>
            </thead>
            <tbody>
                <xsl:for-each select="event">
                    <tr><td><xsl:value-of select="." /></td></tr>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>