//<script language="JScript">

if(WSH.Arguments.length < 2)
{
    WSH.Echo("Usage:\r\n\ttransform XML XSL\r\n");
    WSH.Quit();
}

var sXml = WSH.Arguments(0);
var sXsl = WSH.Arguments(1);

var oXmlDoc = new ActiveXObject("Msxml2.DOMDocument.4.0");
var oXslDoc = new ActiveXObject("Msxml2.DOMDocument.4.0");

oXmlDoc.async = false;
oXslDoc.async = false;

oXmlDoc.load(sXml);
oXslDoc.load(sXsl);

WSH.Echo(oXmlDoc.transformNode(oXslDoc));

//</script>