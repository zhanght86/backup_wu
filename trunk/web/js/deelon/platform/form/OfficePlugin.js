OfficePlugin={officeObjs:new Array(),fileObjs:null,hasOfficeFields:new Array(),hasSubmitOffices:new Array(),submitNum:null,submitNewNum:null,isTabItemOffice:true,init:function(){var num=0;var myNum=0;this.fileObjs=$("input[controltype='office']");for(var i=0;i<this.fileObjs.length;i++){var fileObj=this.fileObjs.get(i);var name=fileObj.getAttribute("name");var fileId=fileObj.getAttribute("value");var doctype="";if(fileId!=null&&fileId!=""){doctype=sysFileType(fileId);}else{fileId="";}var divId="div_"+name.replaceAll(":","_");var div_rq=$("#"+divId);var dwidth=div_rq.css("width").toLowerCase().replaceAll("px","");if(dwidth<700){div_rq.css("width","700px");}var dheight=div_rq.css("height").toLowerCase().replaceAll("px","");if(dheight<700){div_rq.css("height","700px");}var right=fileObj.getAttribute("right");if(right=="w"||right=="b"){if(right=="b"){var validRule=fileObj.getAttribute("validate");if(validRule!=null&&"undefined"!=validRule.toLowerCase()&&validRule.length>2){var json=eval("("+validRule+")");if(json.required){}else{var jsonStr=validRule.substring(0,validRule.lastIndexOf("}"));jsonStr+=",'required':true}";fileObj.setAttribute("validate",jsonStr);}}else{fileObj.setAttribute("validate","{'required':true}");}}num++;}if(right=="no"){div_rq.remove();}else{$.ligerDialog.waitting("正在加载OFFICE文档,请稍候...");var officeObj=new OfficeControl();this.officeObjs.push(officeObj);officeObj.renderTo(divId,{fileId:fileId,doctype:doctype,myNum:myNum});this.hasOfficeFields.push(true);this.hasSubmitOffices.push(false);myNum++;$.ligerDialog.closeWaitting();}}this.submitNum=num;this.submitNewNum=0;},submit:function(){$.ligerDialog.waitting("正在保存OFFICE文档中,请稍候...");for(var d=0;d<this.officeObjs.length;d++){var b=this.officeObjs[d];if(!this.hasOfficeFields[d]){return;}var c=this.fileObjs.get(d).getAttribute("right");if(c=="w"||c=="b"){var a=b.saveRemote(d);if(a==-11){}else{this.fileObjs.get(d).setAttribute("value",a);this.hasSubmitOffices[d]=true;this.submitNewNum=this.submitNewNum-1;}}else{this.hasSubmitOffices[d]=true;}}$.ligerDialog.closeWaitting();}};function sysFileType(a){var b="doc";var c=__ctx+"/platform/system/sysFile/getFileType.ht";$.ajaxSetup({async:false});$.post(c,{fileId:a},function(d){b=d;});$.ajaxSetup({async:true});return b;}