<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/html">
    <html>
    <head>
        <title>Scorecard</title>
        <style type="text/css">
        
        body, table
        {
            background-color: #fbfafb;
            color: #000000;
            font-family: Tahoma; font-size: 8.25pt;
            scrollbar-base-color: #e5e4e8;
        }
        
        tfoot, thead
        {
            font-weight: bold;
        }
        
        a:link, a:visited, a
        {
            color: #9900cc;
        }
        
        .contentTitle
        {
            font-weight: bold;
            font-size: 11pt;
            font-family: Trebuchet MS, Tahoma, Verdana, Arial;
        }
        
        #DivContent
        {
            padding: 2px;
        }
        #DivContent table
        {
            font-family: Trebuchet MS, Tahoma, Verdana, Arial;
            font-size: 10pt;
        }
        
        </style>
    </head>
    <body>
        <div id="DivContent">
        <xsl:value-of select="text()" />
        </div>
    </body>
    </html>
</xsl:stylesheet>