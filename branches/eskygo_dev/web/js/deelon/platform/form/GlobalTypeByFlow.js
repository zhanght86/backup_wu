var globalType=new GlobalType(catKey,"glTypeTree",{onClick:onClick,url:glTypeTreeUrl});$(function(){globalType.loadGlobalTree();$("#defLayout").ligerLayout({leftWidth:210,height:"100%",allowLeftResize:false});});function onClick(b){var a=leftClickUrl;if($.isEmpty(b.parentId)||b.parentId==0){a=leftClickUrl;}else{a=leftClickUrl+"?nodePath="+b.nodePath;}$("#defFrame").attr("src",a);}function treeExpandAll(a){globalType.treeExpandAll(a);}