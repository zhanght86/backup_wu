PageTab=function(m,j,g){var b=function(){alert("addCallBack");};var l=function(n){alert("beforeActive:"+n);};var c=function(n,o){alert("activeCallBack:"+n+","+o);};var a=function(n){alert("beforeDell:curPage:"+n);};var e=function(n){alert("delCallBack:"+n);};var f=function(){alert("txtCallBack");};this.conf=$.extend({},{addCallBack:b,beforeActive:l,activeCallBack:c,beforeDell:a,delCallBack:e,txtCallBack:f},g);this.currentTab=null;var d=__ctx+"/styles/default/css/tab/icon_plus.gif";var k=__ctx+"/styles/default/css/tab/icon_minus.gif";var i='<div class="pagetab" ><ul id="pageList"></ul><span class="add" ><img id="addPage" src="'+d+'" class="imgPlus" title="在当前页后插入" /><img id="delPage" src="'+k+'" class="imgDelete" title="删除当前页" /></span></div>';this.totalPage=(j==undefined)?1:j;this.prePage=1;$("#"+m).append(i);var h=this;$("#pageList").delegate("li>b","dblclick",function(){var n=$(this);var p=n.has("input").length==1;if(p){return;}var o=$("<input type='text' maxlength='20' value='"+n.text()+"' style='border-style:none;height:16px;' size='5' />");o.blur(function(){var s=$(this);var r=s.val();s.parent().text(r);s.remove();var q=h.getCurrentIndex();h.conf.txtCallBack(q);});o.keydown(function(r){if(r.keyCode=="13"){o.parent().text(o.val());o.remove();var q=h.getCurrentIndex();h.conf.txtCallBack(q);}});n.empty();n.append(o);o.focus();});this.init=function(p,o){this.initPages(p);var n=this;$("#addPage").click(function(){n.addPage();});$("#delPage").click(function(){n.deletePage();});},this.initPages=function(q){var p=$("#pageList");p.empty();this.totalPage=q.length;for(var o=1;o<=this.totalPage;o++){var r=q[o-1];if(r==""){r="页 "+o;}var n=$("<li><b>"+r+"</b></li>");this.attachTabEvent(n);p.append(n);}this.currentTab=p.children().first();this.setActivePage();},this.attachTabEvent=function(o){var n=this;o.click(function(){var r=$(this);var q=n.getCurrentIndex();var p=n.conf.beforeActive(q);if(!p){return;}n.currentTab=r;var s=n.getCurrentIndex();n.setActivePage();n.conf.activeCallBack(q,s);});},this.addPage=function(){this.totalPage++;var n=$("<li><b>新页面</b></li>");this.attachTabEvent(n);this.currentTab.after(n);this.currentTab=n;this.setActivePage();this.conf.addCallBack();},this.setActivePage=function(){var n=this.currentTab;if(n.siblings()){n.siblings().removeClass("current");}n.addClass("current");},this.getCurrentIndex=function(){return $("#pageList").children().index(this.currentTab)+1;},this.deletePage=function(){if(this.totalPage==1){return;}var q=this.getCurrentIndex();var o=this.currentTab.next();var p=this.currentTab.prev();var n=this.conf.beforeDell(q);if(!n){return;}this.currentTab.remove();if(o.length>0){this.currentTab=o;}else{this.currentTab=p;}this.totalPage--;this.setActivePage();this.conf.delCallBack(q);};};