<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:user="urn:nikhil-dabas:podrace" version="1.0">
    <msxsl:script language="JScript" implements-prefix="user">
    <![CDATA[
    
    var scoreMap = new Array(5, 3, 2, 1);
    var positionMap = new Array("First", "Second", "Third", "Fourth");
    
    function score(nodeList)
    {
        var node = null;
        var points = 0;
        while(node = nodeList.nextNode())
        {
            var pos = parseInt(node.attributes.getNamedItem("n").text);
            points += scoreMap[pos - 1];
        }
        
        return points;
    }
    
    function position(score1, score2, score3, score4)
    {
        var scores = new Array(score1, score2, score3, score4);
        var uscores = new Array();
        var repeated = false;
        
        // Eliminate any equal scores
        for(var i = 0; i < scores.length; i++)
        {
            repeated = false;
            
            for(var j = i + 1; j < scores.length; j++)
            {
                if(scores[i] == scores[j])
                {
                    repeated = true;
                }
            }
            
            if(!repeated)
            {
                uscores.push(scores[i]);
            }
        }
        
        uscores.sort(integerSort);
        
        for(var i = 0; i < uscores.length; i++)
        {
            if(score1 == uscores[i])
            {
                return (positionMap[uscores.length - i - 1]);
            }
        }
        
        return 0;
    }
    
    function integerSort(n1, n2)
    {
        return (n1 - n2);
    }
    
    var monthNames = new Array(
        "Jan", "Feb", "Mar", "Apr", "May", "Jun",
        "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    );
    
    function formatDateFromNode(nodeList)
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
    
    function formatDateFromTime(time)
    {
        time = parseInt(time.toString());
        var d = new Date(time);
        var s = "";
        s += d.getDate() + " ";
        s += monthNames[d.getMonth()] + " ";
        s += d.getYear();
        return s;
    }
    
    function maxDate()
    {
        return ((new Date()).getTime());
    }
    
    ]]>
    </msxsl:script>
    <xsl:param name="firstDate" select="0" />
    <xsl:param name="lastDate" select="user:maxDate()" />
    <xsl:template match="/scores">
        
        <div class="contentTitle">
            <xsl:value-of select="title" /><br />
            <xsl:value-of select="user:formatDateFromTime($firstDate)" />
             - <xsl:value-of select="user:formatDateFromTime($lastDate)" /><br />
        </div>
        <table cellspacing="2">
        <thead>
            <tr>
                <th colspan="2"></th>
                <th colspan="4">Points</th>
            </tr>
            <tr>
                <th>Event</th>
                <th>Date</th>
                <th width="100">Dayanand</th>
                <th width="100">Gurunanak</th>
                <th width="100">Kabir</th>
                <th width="100">Vivekanand</th>
            </tr>
        </thead>
        <tbody>
        <xsl:for-each select="score[(number(event/@date) &gt;= number($firstDate)) and (number(event/@date) &lt;= number($lastDate))]">
            <xsl:sort select="event/@date" />
            <tr>
                <td><xsl:value-of select="event" /></td>
                <td nowrap="nowrap"><xsl:value-of select="user:formatDateFromNode(.)" /></td>
                <td align="center"><xsl:value-of select="user:score(position[text() = 'D'])" /></td>
                <td align="center"><xsl:value-of select="user:score(position[text() = 'G'])" /></td>
                <td align="center"><xsl:value-of select="user:score(position[text() = 'K'])" /></td>
                <td align="center"><xsl:value-of select="user:score(position[text() = 'V'])" /></td>
            </tr>
        </xsl:for-each>
        </tbody>
        <tfoot>
            <xsl:variable name="totalD" select="user:score(//score[(number(event/@date) &gt;= number($firstDate)) and (number(event/@date) &lt;= number($lastDate))]/position[text() = 'D'])"/>
            <xsl:variable name="totalG" select="user:score(//score[(number(event/@date) &gt;= number($firstDate)) and (number(event/@date) &lt;= number($lastDate))]/position[text() = 'G'])"/>
            <xsl:variable name="totalK" select="user:score(//score[(number(event/@date) &gt;= number($firstDate)) and (number(event/@date) &lt;= number($lastDate))]/position[text() = 'K'])"/>
            <xsl:variable name="totalV" select="user:score(//score[(number(event/@date) &gt;= number($firstDate)) and (number(event/@date) &lt;= number($lastDate))]/position[text() = 'V'])"/>
            <tr style="font-weight: bold;">
                <td colspan="2">Totals</td>
                <td align="center"><xsl:value-of select="$totalD" /></td>
                <td align="center"><xsl:value-of select="$totalG" /></td>
                <td align="center"><xsl:value-of select="$totalK" /></td>
                <td align="center"><xsl:value-of select="$totalV" /></td>
            </tr>
            <tr style="font-weight: bold;">
                <td colspan="2">Positions</td>
                <td align="center"><xsl:value-of select="user:position($totalD, $totalG, $totalK, $totalV)" /></td>
                <td align="center"><xsl:value-of select="user:position($totalG, $totalD, $totalK, $totalV)" /></td>
                <td align="center"><xsl:value-of select="user:position($totalK, $totalG, $totalD, $totalV)" /></td>
                <td align="center"><xsl:value-of select="user:position($totalV, $totalG, $totalK, $totalD)" /></td>
            </tr>
        </tfoot>
        </table>
    </xsl:template>
</xsl:stylesheet>