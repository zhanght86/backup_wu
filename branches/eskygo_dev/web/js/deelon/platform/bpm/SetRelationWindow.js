function SetRelationWindow(d){if(!d){d={};}var c=__ctx+"/platform/form/bpmFormTable/setRelation.ht?tableId="+d.tableId+"&dsName="+d.dsName;var f=600;var b=350;d=$.extend({},{dialogWidth:f,dialogHeight:b,help:0,status:0,scroll:0,center:1,reload:true},d);var a="dialogWidth="+d.dialogWidth+"px;dialogHeight="+d.dialogHeight+"px;help="+d.help+";status="+d.status+";scroll="+d.scroll+";center="+d.center;c=c.getNewUrl();var e=window.showModalDialog(c,"",a);if(d.reload){location.reload();}}