<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:template match="/form">
    <html>
    <head>
        <title><xsl:value-of select="@title" /></title>
        <xsl:copy-of select="head/*" />
        <style type="text/css">
        <![CDATA[
        
        body, table, input, button, select
        {
            color: #000000;
            font-family: Tahoma; font-size: 8.25pt;
        }
        body, table
        {
            background-color: #fbfafb;
            scrollbar-base-color: #e5e4e8;
        }
        body
        {
            border: none;
        }
        
        a:link, a:visited, a
        {
            color: #9900cc;
        }
        
        #TdButtons button
        {
            width: 100px;
            height: 24px;
            margin: 1px;
        }
        
        ]]>
        </style>
        <script language="JScript">
        <![CDATA[
        
        function ButtonOK_onClick()
        {
            var data = new Object();
            
            if(typeof(Form_OK) == "function")
            {
                if(!Form_OK()) return true;
            }
            
            for(var i = 0; i < document.all.length; i++)
            {
                var elem = document.all[i];
                if(elem.id && (elem.id.indexOf("value") == 0))
                {
                    var name = elem.id.substr(5);
                    data[name] = elem.value;
                }
            }
            
            window.returnValue = data;
            window.close();
        }
        
        function ButtonCancel_onClick()
        {
            if(typeof(Form_Cancel) == "function")
            {
                if(!Form_Cancel()) return true;
            }
            
            window.returnValue = null;
            window.close();
        }
        
        function body_onLoad()
        {
            var x, y, h, w;
            h = document.body.scrollHeight + 40;
            w = document.body.scrollWidth + 10;
            window.resizeTo(w, h);
            x = (screen.availWidth - document.body.offsetWidth) / 2;
            y = (screen.availHeight - document.body.offsetHeight) / 2;
            window.moveTo(x, y);
        }
        
        function Form_Init(args)
        {
            window.dialogArguments = args;
            
            if(typeof(Form_Load) == "function")
            {
                Form_Load();
            }
        }
        
        function body_onUnload()
        {
            window.opener.execScript("data.detailsUnloadCallback();");
        }
        
        ]]>
        </script>
    </head>
    <body scroll="no" onload="return body_onLoad();" onunload="return body_onUnload();">
        <table border="0" cellspacing="1" cellpadding="2">
            <tbody><tr>
                <td valign="top">
                    <xsl:copy-of select="layout/*" />
                </td>
                <td valign="top" id="TdButtons">
                <button id="ButtonOK" type="submit" onclick="return ButtonOK_onClick();">OK</button><br />
                <button id="ButtonCancel" type="reset" onclick="return ButtonCancel_onClick();">Cancel</button>
                </td>
            </tr></tbody>
        </table>
    </body>
    </html>
    </xsl:template>
</xsl:stylesheet>