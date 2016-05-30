var editor=null;$(function(){var d=$("#sql").width();var a=$("#sql").height();editor=CodeMirror.fromTextArea(document.getElementById("sql"),{mode:"text/x-mariadb",lineWrapping:true,lineNumbers:true});editor.setSize(d,a);var b=window.dialogArguments;if(b){if(b.source){$("#source").val(b.source);}if(b.filter){var f=b.filter.condition,c=b.filter.type;if(b.filter.name){$("#name").val(b.filter.name);}if(b.filter.key){$("#key").val(b.filter.key);}if(!$.isEmpty(c)){f=initType(c,f);}if(!$.isEmpty(f)){$("#filterTxt").val(f);}}}var e=getInitData();FormUtil.handSelector();FormUtil.initCalendar();$("#ruleDiv").linkdiv({data:e,updateContent:updateContent,rule2json:rule2json});$("#type").change(function(){changeType($(this).val());});$("#sqlTip").qtip({content:{text:"<div>该脚本为 groovyScript脚本 ，返回值为可执行的sql语句,"+'<p>例：String sql ="select ID,field from table where 1=1";<br/>'+'Object field = map.get("field");<br/>'+"if(field!=null)<br/>"+'&nbsp;&nbsp;sql += " and field like \'%"+field+"%\'";<br/>'+"return sql; </p>"+"其中的map为系统所封装的一个参数;"+'<br/>在脚本中使用map.get("field")可以获取表单提交时所携带的field参数值，脚本应拼接并返回任意的可执行的sql语句.返回的sql中要含有ID</div>'}});});function changeType(a){if(a==2){$("#filterSetting").hide();$("#sqlSetting").show();editor.setValue("");}else{$("#filterSetting").show();$("#sqlSetting").hide();}}function initType(a,b){$("#type").val(a);changeType(a);if(a==2){editor.setValue(b);b="";}return b;}function varsChange(){var a=$(this),b=a.val();if($.isEmpty(b)){return;}a.val("");editor.replaceSelection(b);}function fieldChange(){var b=$(this),a=b.find("option:selected"),c=a.attr("source"),d=b.val();if($.isEmpty(d)){return;}d=(c==1?("F_"+d):d);b.val("");editor.replaceSelection(d);}function tableChange(){var b=$(this),a=b.find("option:selected"),c=a.attr("source"),d=b.val();if($.isEmpty(d)){return;}d=(c==1?("W_"+d):d);b.val("");editor.replaceSelection(d);}function getInitData(){var data=$("#filterTxt").val().trim();if(data==""){return"";}var json=eval("("+data+")");if(json.length==0){return"";}return json;}function updateContent(k,e){var c=$('<div class="nobr" style="float:left;margin-right:-999em;"></div>'),i=$("#flowVarsSelect").clone(true).removeAttr("id"),g=$("#paramKey").clone(true).removeAttr("id"),f=$("#paramCondition").clone(true).removeAttr("id"),b=$("#paramValue").clone(true).removeAttr("id"),d;if(!e){d="1";}else{d=e.ruleType;}if(d=="1"){labelSpan=$('<span class="label-span left"></span>').attr("ruleType",d).text("普通条件");c.append(labelSpan).append(i).append($('<div class="judge left margin-set"></div>'));$("div.nobr",k).remove();k.append(c);if(e){i.val(e.flowvarKey).trigger("change");var a=$("div.judgeExp",k),j=$("div.judgeExp2",k);if(a){setJudgeValue(a,e.judgeCon1,true);setJudgeValue(a,e.judgeVal1,false);}if(j){setJudgeValue(j,e.judgeCon2,true);setJudgeValue(j,e.judgeVal2,false);}}}else{if(d=="2"){labelSpan=$('<span class="label-span left"></span>').attr("ruleType",d).text("脚本条件");var h=$('<div class="judge left margin-set"></div>').append($('<a name="script" href="###" onclick="editConditionScript(this)">脚本</a>'));c.append(labelSpan).append(h);$("div.nobr",k).remove();k.append(c);if(e.script){k.data("script",e.script);k.data("tables",e.tables);}else{if(typeof e.script==="undefined"){addConditionScript(k);}}}else{if(d=="3"){labelSpan=$('<span class="label-span left"></span>').attr("ruleType",d).text("用户属性");}else{labelSpan=$('<span class="label-span left"></span>').attr("ruleType",d).text("组织属性");}c.append(labelSpan).append(g).append(f).append(b);$("div.nobr",k).remove();k.append(c);if(e){g.val(e.paramKey);f.val(e.paramCondition);b.val(e.paramValue);}}}}function rule2json(t){var b={},r=$("span.label-span",t).attr("ruleType");if(r=="1"){var a=$("select[name='flowVars']",t).val(),u=$("select[name='flowVars']",t).find("option:selected"),h=u.text(),m=u.attr("source"),q=u.attr("table"),o=u.attr("maintable"),e=u.attr("relation"),s=$("div.judgeExp",t),k=$("div.judgeExp2",t),d=u.attr("ishidden"),l=[];b.source=m;b.table=q;b.mainTable=o;b.relation=e;b.isHidden=d;if(!s||s.length==0){return null;}l.push(h);var j=s.attr("optType");b.optType=j;b.flowvarKey=a;b.datefmt=s.attr("datefmt");b.judgeCon1=$("select[name='judgeCondition']",s).val();l.push($("select[name='judgeCondition']",s).find("option:selected").text());b.judgeVal1=getJudgeValue(s);l.push(getJudgeText(s));if(k&&k.length>0){b.judgeCon2=$("select[name='judgeCondition']",k).val();l.push("并且");l.push($("select[name='judgeCondition']",k).find("option:selected").text());b.judgeVal2=getJudgeValue(k);l.push(getJudgeText(k));}b.conDesc=l.join(" ");}else{if(r=="2"){var v=t.data("script"),f=t.data("tables");b.script=v;b.tables=f;b.conDesc=" 脚本 ";}else{var l=[];var i=$("select[name='paramKey']",t).val(),p=$("select[name='paramKey']",t).find("option:selected").attr("title");var c=$("select[name='paramCondition']",t).val();var g=$("input[name='paramValue']",t).val();b.paramKey=i;b.paramCondition=c;b.paramValue=g;l.push(i);l.push(c);l.push(g);b.conDesc=l.join(" ");b.expression=i+c+g;b.dataType=p;}}b.ruleType=r;var n=$("select.computing-select",t).val();if(n){b.compType=n;}return b;}function ScriptDialog(d){if(!d){d={};}var c=__ctx+"/platform/form/bpmDataTemplate/script.ht?tableId="+d.tableId;var f=800;var b=600;d=$.extend({},{dialogWidth:f,dialogHeight:b,help:0,status:0,scroll:1,center:1},d);var a="dialogWidth="+d.dialogWidth+"px;dialogHeight="+d.dialogHeight+"px;help="+d.help+";status="+d.status+";scroll="+d.scroll+";center="+d.center;c=c.getNewUrl();var e=window.showModalDialog(c,d.data,a);if(e!=undefined){if(d.callback){d.callback.call(this,e);}}}function addConditionScript(a){ScriptDialog({tableId:$("#tableId").val(),callback:function(b){a.data("script",b.script);a.data("tables",b.tables);}});}function editConditionScript(b){var d=$(b),c=d.parent().parent().parent(),a=c.data("script");tables=c.data("tables");ScriptDialog({tableId:$("#tableId").val(),data:{script:a,tables:tables},callback:function(e){c.data("script",e.script);c.data("tables",e.tables);}});}function setJudgeValue(c,d,b){if(!c){return;}if(!b){c.find("input").each(function(){var f=$(this),h=f.val(),e=f.attr("type");if(e=="checkbox"||e=="radio"){if(d.indexOf(h)>-1){f.attr("checked","checked");}}else{if(/\&\&/.test(d)){var g=d.split(/\&\&/);if(f.attr("type")=="hidden"){f.val(g[0]);}else{f.val(g[1]);}}else{f.val(d);}}});}var a=c.find("select");a.each(function(){var f=$(this),e=f.attr("name");if((e=="judgeCondition")==b){f.val(d);}});if(b){a.trigger("change");}}function flowVarChange(){var e=$(this),b=e.parents("div.nobr"),c=e.find("option:selected");if(!c.val()){return;}var d=getFlowVarType(c),f=c.attr("datefmt"),i=null;var h=$("div.judge",b).empty(),a=getJudgeExp(d,c);h.append(a);if(d==1||d==3){var g=a.clone(true).removeClass("judgeExp").addClass("judgeExp2");h.append(g);}}function judgeConditionChange(){var g=$(this),d=g.parent(),a=d.next(".judge-value"),h=a.attr("type"),c=d.parent().attr("opttype");if(c!="5"){return;}if(g.val()==1||g.val()==2){if(h==1){return;}var e=d.parent().parent().parent().find("option:selected");var f=getFlowVarType(e);var i=getInput(f,e);a.remove();d.parent().append(i);}else{if(h==2){return;}var b=$("#commonVar").clone(true).removeAttr("id");a.remove();d.parent().append(b);}}function getFlowVarType(b){var d=b.val(),c=b.attr("ctltype"),a=b.attr("ftype");if(c){switch(c.toString()){case"4":case"5":case"6":case"7":case"8":case"17":case"18":case"19":return 5;case"3":case"11":case"13":case"14":return 4;case"15":return 3;}}if(d=="startUser"){return 5;}if(a){switch(a.toLowerCase()){case"int":case"number":return 1;case"varchar":case"string":return 2;case"date":return 3;}}return 2;}function getJudgeExp(a,d){var c=$('<div class="judgeExp left"></div>'),f=$("#judgeCon-"+a).clone(true).removeAttr("id");if(!f||f.length==0){f=$("#judgeCon-1").clone(true).removeAttr("id");}var e=f.find("select").val();c.attr("optType",a).append(f);var b=getInput(a,d);c.append(b);return c;}function getInput(a,c){var b;switch(a){case 1:case 2:b=$("#normal-input").clone(true).removeAttr("id");break;case 3:var d=c.attr("datefmt");if($.isEmpty(d)){d="yyyy-MM-dd";}b=$("#date-input").clone(true).removeAttr("id").attr("datefmt",d);break;case 4:b=getDicControl(c);break;case 5:b=getSelector(c).children();break;}return b;}function getDicControl(option){var value=option.val(),ctltype=option.attr("ctltype"),chosenopt=option.attr("chosenopt"),opts=eval("("+chosenopt+")"),html="",data=[],type="";var tempHtml=$("#dic-radio-checkbox").val();if(ctltype.toString()=="13"||ctltype.toString()=="14"){type="checkbox";}else{tempHtml=$("#dic-select").val();}for(var i=0,c;c=opts[i++];){data.push({type:type,name:value,option:c.key,memo:c.value});}html=easyTemplate(tempHtml,data).toString();return $(html);}function getSelector(b){var a=b.attr("ctltype"),c=b.val(),e="user-div";switch(a.toString()){case"4":case"8":e="user-div";break;case"5":case"17":e="role-div";break;case"6":case"18":e="org-div";break;case"7":case"19":e="position-div";break;}var d=$("#"+e).clone(true,true).removeAttr("id");$("input[type='text']",d).attr("name",c);$("input[type='hidden']",d).attr("name",c+"ID");$("a.link",d).attr("name",c);return d;}function getJudgeValue(a){if(!a){return"";}var b=[];a.find("input").each(function(){var d=$(this),c=d.attr("type");if(c=="checkbox"||c=="radio"){if(d.attr("checked")){b.push(d.val());}}else{b.push(d.val());}});a.find("select").each(function(){var d=$(this),c=d.attr("name");if(c=="judgeCondition"){return true;}b.push(d.val());});return b.join("&&");}function getJudgeText(a){if(!a){return"";}var b=[];a.find("input:visible").each(function(){var d=$(this),c=d.attr("type");if(c=="checkbox"||c=="radio"){if(d.attr("checked")){b.push(d.parent().text());}}else{b.push(d.val());}});a.find("select").each(function(){var d=$(this),c=d.attr("name");if(c=="judgeCondition"){return true;}b.push(d.find("option:selected").text());});return b.join("&&");}function addDiv(a){$("#ruleDiv").linkdiv("addDiv",{ruleType:a});}function removeDiv(){$("#ruleDiv").linkdiv("removeDiv");}function assembleDiv(){$("#ruleDiv").linkdiv("assembleDiv");}function splitDiv(){$("#ruleDiv").linkdiv("splitDiv");}function getData(){return $("#ruleDiv").linkdiv("getData");}function save(){var g="",b=$("#name"),d=b.val(),c=$("#key"),a=c.val(),e=$("#type").val(),f={};if(d==""||a==""){alert("请输入过滤名称或key！");return;}if(e==2){editor.save();g=$("#sql").val();}else{g=getData();}f.condition=g;f.name=d;f.key=a;f.type=e;window.returnValue=f;window.close();}function getPingyin(c){var a=$(c).val();if($.trim(a).length<1){return;}var b=Share.getPingyin({input:a});if($.trim($("#key").val()).length>1){return;}$("#key").val(b);}