<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:user="urn:nikhil-dabas:podrace" version="1.0">
    <msxsl:script language="JScript" implements-prefix="user">
    <![CDATA[
    
    var monthNames = new Array(
        "Jan", "Feb", "Mar", "Apr", "May", "Jun",
        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    );
    
    function formatDate(nodeList)
    {
        var node = nodeList.nextNode().selectSingleNode("event/@date");
        var time = parseInt(node.text);
        var d = new Date(time);
        var s = "";
        s += d.getDate() + " ";
        s += monthNames[d.getMonth()] + " ";
        s += d.getYear();
        return s;
    }
    
    ]]>
    </msxsl:script>
    <xsl:template match="/scores">
        <div class="contentTitle">
            <xsl:value-of select="title" />
        </div>
        <table id="TableData" onrowselect="return TableData_onRowSelect();" cellpadding="2" cellspacing="0" style="behavior: url(tablehl.htc); cursor: hand;" hlstyle="background-color:#c1d2ee;" slstyle="background-color:#316ac5;color:#ffffff;">
            <thead>
                <tr>
                    <th>Event name</th>
                    <th>Date</th>
                    <th width="50">D</th>
                    <th width="50">G</th>
                    <th width="50">K</th>
                    <th width="50">V</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="score">
                    <tr>
                        <td><xsl:value-of select="event" /></td>
                        <td nowrap="nowrap"><xsl:value-of select="user:formatDate(.)" /></td>
                        <td align="center"><xsl:value-of select="positions/@D" /></td>
                        <td align="center"><xsl:value-of select="positions/@G" /></td>
                        <td align="center"><xsl:value-of select="positions/@K" /></td>
                        <td align="center"><xsl:value-of select="positions/@V" /></td>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>