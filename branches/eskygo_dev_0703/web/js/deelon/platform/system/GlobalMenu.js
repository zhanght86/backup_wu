GlobalMenu=function(){this.rootMenu=null;this.menuMenu=null;this.treeNode=null;this.menuMenuFlat=null;this.getMenu=function(c,b){this.treeNode=c;var a=0;if(c.isRoot){a=1;}if(this.menuMenu==null){this.menuMenu=$.ligerMenu({top:100,left:100,width:120,items:[{text:"增加分类",click:b},{text:"删除",click:b},{text:"导出",click:b},{text:"导入",click:b},{text:"排序",click:b},{text:"刷新",click:b}]});}if(this.menuMenuFlat==null){this.menuMenuFlat=$.ligerMenu({top:100,left:100,width:120,items:[{text:"删除",click:b},{text:"导出",click:b},{text:"导入",click:b}]});}if(this.rootMenu==null){this.rootMenu=$.ligerMenu({top:100,left:100,width:120,items:[{text:"增加分类",click:b},{text:"导出",click:b},{text:"导入",click:b},{text:"排序",click:b},{text:"刷新",click:b}]});}if(a==1){return this.rootMenu;}else{if(c.type==0){return this.menuMenuFlat;}return this.menuMenu;}};};FlowTypeMenu=function(){this.rootMenu=null;this.menuMenu=null;this.treeNode=null;this.getMenu=function(c,b){this.treeNode=c;var a=0;if(c.isRoot){a=1;}if(this.menuMenu==null){this.menuMenu=$.ligerMenu({top:100,left:100,width:120,items:[{text:"增加分类",click:b},{text:"编辑分类",click:b},{text:"删除分类",click:b}]});}if(this.rootMenu==null){this.rootMenu=$.ligerMenu({top:100,left:100,width:120,items:[{text:"增加分类",click:b}]});}if(a==1){return this.rootMenu;}else{return this.menuMenu;}};};ReportTypeMenu=function(){this.rootMenu=null;this.menuMenu=null;this.treeNode=null;this.getMenu=function(c,b){this.treeNode=c;var a=0;if(c.isRoot){a=1;}if(this.menuMenu==null){this.menuMenu=$.ligerMenu({top:100,left:100,width:120,items:[{text:"增加分类",click:b},{text:"编辑分类",click:b},{text:"删除分类",click:b}]});}if(this.rootMenu==null){this.rootMenu=$.ligerMenu({top:100,left:100,width:120,items:[{text:"增加分类",click:b}]});}if(a==1){return this.rootMenu;}else{return this.menuMenu;}};};DicMenu=function(){this.rootMenu=null;this.menuMenu=null;this.treeNode=null;this.getMenu=function(d,c){this.treeNode=d;var b=0;if(d.isRoot){b=1;}if(this.menuMenu==null){var a=[{text:"增加字典分类",click:c},{text:"编辑分类",click:c},{text:"排序",click:c},{text:"删除",click:c}];if(d.type==0){a.splice(0,1);}this.menuMenu=$.ligerMenu({top:100,left:100,width:120,items:a});}if(this.rootMenu==null){this.rootMenu=$.ligerMenu({top:100,left:100,width:120,items:[{text:"增加字典分类",click:c},{text:"排序",click:c}]});}if(b==1){return this.rootMenu;}else{return this.menuMenu;}};};