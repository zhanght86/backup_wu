function BpmQueryDialog(d){if(!d){d={};}var c=__ctx+"/platform/bpm/bpmFormQuery/dialog.ht";var f=460;var b=400;$.extend(d,{dialogWidth:f,dialogHeight:b,help:0,status:0,scroll:1,center:1});var a="dialogWidth="+d.dialogWidth+"px;dialogHeight="+d.dialogHeight+"px;help="+d.help+";status="+d.status+";scroll="+d.scroll+";center="+d.center;c=c.getNewUrl();var e=window.showModalDialog(c,d,a);if(e!=undefined){d.callback(e);}}