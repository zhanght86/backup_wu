function IconDialog(d){if(!d){d={};}var c=__ctx+"/platform/system/resources/dialog.ht";if(d.params){c+="?"+d.params;}var f=700;var b=400;d=$.extend({},{dialogWidth:f,dialogHeight:b,help:0,status:0,scroll:0,center:1},d);var a="dialogWidth="+d.dialogWidth+"px;dialogHeight="+d.dialogHeight+"px;help="+d.help+";status="+d.status+";scroll="+d.scroll+";center="+d.center;c=c.getNewUrl();var e=window.showModalDialog(c,"",a);if(e!=undefined){if(d.callback){d.callback.call(this,e.srcValue);}}}