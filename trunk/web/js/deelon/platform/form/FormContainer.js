FormContainer=function(){this.splitor="#page#";this.aryTitle=new Array();this.aryForm=new Array();this.init=function(b,a){this.aryTitle=b.split(this.splitor);this.aryForm=a.split(this.splitor);},this.insertForm=function(c,b,a){jQuery.insert(this.aryTitle,c,a);jQuery.insert(this.aryForm,b,a);},this.setForm=function(c,b,a){this.aryTitle[a]=c;this.aryForm[a]=b;},this.setFormHtml=function(b,a){this.aryForm[a]=b;},this.setFormTitle=function(b,a){this.aryTitle[a]=b;},this.getForm=function(a){return{title:this.aryTitle[a],form:this.aryForm[a]};},this.removeForm=function(a){this.aryTitle.splice(a,1);this.aryForm.splice(a,1);},this.getResult=function(){return{title:this.aryTitle.join(this.splitor),form:this.aryForm.join(this.splitor)};};};