function BpmDefinitionDialog(e){e=e||{};var d={isSingle:false,showAll:1,validStatus:1};e=$.extend(d,e);var c=__ctx+"/platform/bpm/bpmDefinition/dialog.ht?isSingle={0}&showAll={1}&validStatus={2}";c=String.format(c,e.isSingle,e.showAll,e.validStatus);var a="dialogWidth=860px;dialogHeight=600px;help=0;status=0;scroll=1;center=1";c=c.getNewUrl();var h=window.showModalDialog(c,e,a);if(h!=undefined){if(e.callback){var f=h.defIds;var b=h.subjects;if(e.returnDefKey){var g=h.defKeys;e.callback.call(this,f,b,g);}else{e.callback.call(this,f,b);}}}}