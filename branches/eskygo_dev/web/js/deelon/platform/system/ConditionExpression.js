Namespace.register("com.deelon.platform.system");com.deelon.platform.system.ConditionExpression=function(){this.sb=new StringBuffer();this.hasError=false;this.index=0;this.reset=function(){this.sb=new StringBuffer();this.hasError=false;window.status="";};this.getResult=function(){if(this.hasError){return"当前构建条件不符合规则,请仔细检查表达式!";}return this.sb.toString();};this.validNode=function(d){var c=d.type;var e=d.children;var b=d.getParentNode();var f=d.getPreNode();var a=d.getNextNode();if(c=="3"){if(b){return;}if(a){if(a.type=="3"){this.hasError=true;window.status=("type 3 nextNode.type=='3'");return;}else{if(a.children&&a.children.length>0){window.status=("type 3 nextNode.children");this.hasError=true;return;}}}if(f){if(f.type=="3"){this.hasError=true;window.status=("type 3 preNode.type=='3'");return;}else{if(f.children&&f.children.length>0){this.hasError=true;window.status=("type 3 preNode.children");return;}}}}else{if(c!="3"&&e&&e.length>0){if(b){return;}if(a){if(a.type=="3"){this.hasError=true;window.status=("条件节点，有子节点  nextNode.type=='3'"+d.name+","+d.id);return;}else{if(a.children&&a.children.length>0){window.status=(d.id+","+d.name+"条件节点，有子节点  nextNode.children");this.hasError=true;return;}}}if(f){if(f.type=="3"){this.hasError=true;window.status=("条件节点，有子节点  preNode.type=='3'");return;}else{if(f.children&&f.children.length>0){window.status=("条件节点，有子节点  preNode.children");this.hasError=true;return;}}}}else{if(a==null){window.status=("条件节点 ，当前节点无子节点 没有下面的节点,"+e+","+d.name+","+d.id);this.hasError=true;return;}else{if(a.children==null&&a.type!="3"){window.status=("条件节点 ，nextNode.type!='3' childs:"+e+","+d.type+","+d.name+","+a.type+","+a.id);this.hasError=true;return;}}if(f==null){window.status=("条件节点 ，preNode==null"+d.id+","+d.name);this.hasError=true;return;}else{if(f.children==null&&f.type!="3"){window.status=("条件节点 ，preNode.childs==null");this.hasError=true;return;}}}}};this.evaluate=function(e){this.validNode(e);var c=0;if(e.children){c=e.children.length;}if(e.type=="3"){this.sb.append(" "+e.expression+" ");}else{if((e.type=="1"||e.type=="2")&&c==0){this.sb.append(" "+e.typeName+" ");}else{if((e.type=="1"||e.type=="2")&&c>0){this.sb.append("(");var f=e.children;var a=f.length;for(var d=0;d<a;d++){var g=f[d];this.validNode(g);var b=0;if(g.children){b=g.children.length;}if(g.type!="3"){if((e.type=="1"||e.type=="2")&&b==0){if(d>0&&d<a-1){this.sb.append(" "+g.typeName+" ");}}else{this.sb.append(" "+e.typeName+" ");this.evaluate(g);}}else{if(d>0&&d<a){this.sb.append(" "+e.typeName+" "+" "+g.expression+" ");}else{this.sb.append(" "+g.expression+" ");}}}this.sb.append(")");}}}};this.genNode=function(d,f){this.index++;var b=__ctx;var d=$("input[name=action]:checked").val();var a=f;var e=new Object();e.expression="";e.id=this.index;var c="";switch(d){case"1":e.name="OR(或)";c="Or";e.icon=b+"/themes/img/commons/or.gif";e.image="/themes/img/commons/or.gif";break;case"2":e.name="AND(和)";c="And";e.icon=b+"/themes/img/commons/and.gif";e.image="/themes/img/commons/and.gif";break;case"3":e.name=a;e.icon=b+"/themes/img/commons/code.gif";e.expression=a;e.image="/themes/img/commons/code.gif";break;}e.type=d;e.typeName=c;return e;};};