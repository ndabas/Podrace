//<script language="JScript">

function modelessDialog(data, type, options, callback)
{
    if(typeof(callback) == "function")
    {
        this.callback = callback;
    }
    
    this.onbeforeunload = function()
    {
        this.win.detachEvent("onload", this.onload);
        this.win.detachEvent("onbeforeunload", this.onbeforeunload);
        
        if(this.callback)
        {
            var retVal = this.win.returnValue;
            this.callback(retVal);
        }
    };
    
    this.onload = function()
    {
        this.win.dialogArguments = this.args;
        this.win.attachEvent("onbeforeunload", this.onbeforeunload);
        
        if(this.options.autosize)
        {
            var h = this.win.document.body.scrollHeight + 40;
            var w = this.win.document.body.scrollWidth + 10;
            this.win.resizeTo(w, h);
        }
        if(this.options.autocenter)
        {
            var x = (screen.availWidth - this.win.document.body.offsetWidth) / 2;
            var y = (screen.availHeight - this.win.document.body.offsetHeight) / 2;
            this.win.moveTo(x, y);
        }
        
        var fn = this.win.dialog_init;
        if(typeof(fn) == "function")
        {
            fn();
        }
    };
    
    this.win = null;
    this.url = type == "url" ? data : null;
    this.html = type == "html" ? data : null;
    
    if(!options)
    {
        options = {
            toolbar:false,
            location:false,
            links:false,
            status:false,
            menubar:false,
            scrollbars:true,
            resizable:true,
            width:200,
            height:100,
            autosize:true,
            autocenter:true
        };
    }
    this.options = options;
    
    this.show = function(args)
    {
        var name = "md" + (new Date()).getTime().toString();
        var features = "";
        features += "toolbar=" + this.options.toolbar ? "1," : "0,";
        features += "loaction=" + this.options.location ? "1," : "0,";
        features += "directories=" + this.options.links ? "1," : "0,";
        features += "status=" + this.options.status ? "1," : "0,";
        features += "menubar=" + this.options.menubar ? "1," : "0,";
        features += "scrollbars=" + this.options.scrollbars ? "1," : "0,";
        features += "resizable=" + this.options.resizable ? "1," : "0,";
        features += "width=" + this.options.width;
        features += "height=" + this.options.height;
        
        this.win = window.open("about:blank", name, features);
        this.args = args;
        this.win.attachEvent("onload", this.onload);
        if(this.url)
        {
            this.win.location = this.url;
        }
        else
        {
            var doc = this.win.document;
            doc.open();
            doc.write(this.html);
            doc.close();
        }
    };
}

//</script>