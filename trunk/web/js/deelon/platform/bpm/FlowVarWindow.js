function FlowVarWindow(d){if(!d){d={};}var c;if(d.defId!=null){c=__ctx+"/platform/bpm/bpmDefVar/getByDeployNode.ht?defId="+d.defId;}else{c=__ctx+"/platform/bpm/bpmDefVar/getByDeployNode.ht?deployId="+d.deployId+"&nodeId="+d.nodeId;}var f=500;var b=300;d=$.extend({},{dialogWidth:f,dialogHeight:b,help:0,status:0,scroll:0,center:1},d);var a="dialogWidth="+d.dialogWidth+"px;dialogHeight="+d.dialogHeight+"px;help="+d.help+";status="+d.status+";scroll="+d.scroll+";center="+d.center;c=c.getNewUrl();var e=window.showModalDialog(c,"",a);if(e!=undefined){if(d.callback){d.callback.call(this,e.key,e.name);}}}