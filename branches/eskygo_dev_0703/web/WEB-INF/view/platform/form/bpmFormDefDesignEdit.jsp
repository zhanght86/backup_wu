
<%--
	time:2011-11-16 16:34:16
--%>
<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/commons/include/html_doctype.html"%>
<html>
<head>
<title>表单设计</title>
<%@include file="/commons/include/form.jsp"%>
<%-- <link rel="stylesheet" href="${ctx}/styles/default/css/tab/tab.css" type="text/css" /> --%>
<f:link href="tab/tab.css"></f:link>
<script type="text/javascript" src="${ctx}/js/deelon/platform/form/CommonDialog.js"></script>
<script type="text/javascript" src="${ctx}/js/lg/plugins/ligerWindow.js"></script>
<script type="text/javascript" src="${ctx}/js/lg/plugins/ligerDialog.js"></script>
<script type="text/javascript" src="${ctx}/js/lg/plugins/ligerComboBox.js"></script>
<script type="text/javascript" src="${ctx}/js/deelon/CustomValid.js"></script>
<script type="text/javascript" src="${ctx}/js/deelon/platform/form/PageTab.js"></script>
<script type="text/javascript" src="${ctx}/js/deelon/platform/form/FormContainer.js"></script>
<script type="text/javascript" src="${ctx}/js/deelon/platform/form/FormDef.js"></script>
<!-- ueditor -->
<script type="text/javascript" charset="utf-8" src="${ctx}/js/ueditor2/design-setting/editor_config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/js/ueditor2/editor_api.js"></script>
<style type="text/css">
	.panel-body{
		overflow:hidden;
	}
</style>
<script type="text/javascript">
	var editor,
		valid,
		tabTitle="${bpmFormDef.tabTitle}",
		formContainer,
		tabControl,
		canEditColumnNameAndType=${canEditColumnNameAndType},
		isPublish=${isPublish},
		locale='zh_cn';;
		
	
	$(function(){		
		var h = $(document.body).height();
		FormDef.getEditor({
			height:230,
			width:10,
			lang:locale
		});
		editor.addListener('ready',function(){
			if(!canEditColumnNameAndType)editor.canEditColumnNameAndType = 1;
				initTab();
		});
		
		editor.render("txtHtml");
		editor.formDefId=$("#formDefId").val();
		
		valid=$("#bpmFormDefForm").form();
		
		$("#btnPreView").click(function(){
			preView();
		});
		
		$("#btnNext").click(function(){
			nextStep();
		});
		
		$("#btnSaveForm").click(function(){
			saveForm();
		});
		
   		window.onbeforeunload = function() {				 											
     		  return '你确定吗？';
     	 };
	});
	
	function nextStep(){
		if (FormDef.isSourceMode) {
			$.ligerDialog.warn('不能在源代码模式下执行下一步',"提示信息");
			return;
		}
		saveChange();
		var frm=document.getElementById("bpmFormDefForm");
		frm.action="designTable.ht";
		
		var rtn=valid.valid();
		if(!rtn) return;
		var callBack=function(){
			var objForm = formContainer.getResult();
			$("#content").val(objForm.form);
			$("#tabTitle").val(objForm.title);
			frm.submit();
		}
		validForm(callBack);
		window.onbeforeunload = null;
	}
	//表单保存到本地
	function exportform(){
		saveChange();
		var objForm = formContainer.getResult();
		var subject=$("#subject").val(),
			html= htmlDecode(objForm.form),
			tabTitle= objForm.title;
		
		var frm=new com.deelon.form.Form();
		frm.creatForm("exportForm","exportForm.ht");		
		frm.addFormEl("subject",subject);
		frm.addFormEl("title",objForm.title);
		frm.addFormEl("html",htmlDecode(objForm.form));
		frm.setTarget("_blank");
		frm.setMethod("post");
		frm.submit();
		frm.clearFormEl();
		
		//location.href="exportForm.ht?html="+html+"&subject="+subject;
	};
	
	function saveForm(){
		var rtn=valid.valid();
		if(!rtn) return;
		if (FormDef.isSourceMode) {
			$.ligerDialog.warn('不能在源代码模式下保存',"提示信息");
			return;
		}
		saveChange();
		var callBack=function(){
			var params={};
			params.formDefId=$("#formDefId").val();
			params.categoryId=$("#categoryId").val();
			params.subject=$("#subject").val();
			params.formDesc=$("#formDesc").val();
			//是否发布
			if(isPublish){
				params.tableName=$("#tableName").val();
				params.tableComment=$("#tableComment").val();
			}
			
			var objForm = formContainer.getResult();
			params.html= htmlDecode(objForm.form);
			params.tabTitle= objForm.title;
			
			$.post("saveForm.ht",params,function(responseText){
				var obj=new com.deelon.form.ResultMessage(responseText);
				if(obj.isSuccess()){//成功
					$.ligerDialog.success(obj.getMessage(),'提示信息',function(){
						window.onbeforeunload = null;
						if(window.opener){
							if(window.opener.parent.reload){
								window.opener.parent.reload();
							}
							else if(window.opener.reload){
								window.opener.reload();
							}
						}
						window.close();
					});
				}
				else{
					$.ligerDialog.err('出错信息',"保存表单设计失败",obj.getMessage());
				}
			});
		}
		validForm(callBack);
	}
	//预览验证回调
	function preCallBack(tableName,comment,html){
		var objForm = formContainer.getResult();
		var frm=new com.deelon.form.Form();
		frm.creatForm("bpmPreview","preview.ht");
	//	frm.addFormEl("formDefId",$("#formDefId").val());		
		frm.addFormEl("name",tableName);
		frm.addFormEl("title",objForm.title);
		frm.addFormEl("html",htmlDecode(objForm.form));
		frm.addFormEl("comment",comment);
		frm.setTarget("_blank");
		frm.setMethod("post");
		frm.submit();
		frm.clearFormEl();
	};
	
	function preView(){
		var rtn=valid.valid();
		if(!rtn) return;		
		validForm(preCallBack);
		
	};
	//验证表单是否合法。
	function validForm(callBack){
		saveChange();		
		var tableName=$("#tableName").val(),
			comment=$("#tableComment").val(),
			formDefId=$("#formDefId").val(),
			objForm = formContainer.getResult();
		var html = htmlDecode(objForm.form);//external中的内容需要替换回单引号和双引号
	
		var params={};
		params.title=objForm.title;
		params.html=html;
		params.tableName=tableName;
		params.tableComment=comment;
		params.formDefId=formDefId;
		
		$.post('validDesign.ht', params, function(data){
			if(data.valid){
				//使用回调函数
				callBack(tableName,comment,html,data);
			}
			else{
				$.ligerDialog.err('出错信息',"验证表单设计失败",data.errorMsg);
			}
		});
	};
	
	function clickOk(item,dialog,t,m,f){
		$.ligerDialog.confirm('确认更换模板吗?', function (rtn){
             if(rtn){
            	var form = $(document.getElementById('chooseTemplate').contentDocument);
         		var tempalias=$("#tempname", form).val();
         		$.post('getHtmlByAlias.ht',{tempalias:tempalias},function(data){
         			editor.setContent('');
         			setTimeout(function(){editor.setContent(data);},10);
         		})
         		dialog.close();
             }
          });		
	};
	//打开选择模板的选择窗口
	function showSelectTemplate(url){
		var buttons = [ {
			text : "确定",
			onclick : clickOk
		} ],
		width=550,
		height=350,
		left = ($(window).width() - width) / 2,
		top = ($(window).height() - height) / 2;
		var p = {
			url : url,
			width : width,
			height : height,
			left : left,
			top : top,
			title : '选择模板',
			buttons : buttons,
			name : 'chooseTemplate'
		};
		$.ligerDialog.open(p);
	};	
	//解码单引号和双引号
	function htmlDecode(str){
		return str.replace(/\&quot\;/g, '\"').replace(/\&\#39\;/g, '\'');
	};
	
	//初始化TAB
	function initTab() {
		var formData = editor.getContent();
		if (tabTitle == "")
			tabTitle = "页面1";
		formContainer = new FormContainer();
		var aryTitle = tabTitle.split(formContainer.splitor);
		var aryForm = formData.split(formContainer.splitor);
		var aryLen = aryTitle.length;
		//初始化
		formContainer.init(tabTitle, formData);

		tabControl = new PageTab("pageTabContainer", aryLen, {
			addCallBack : addCallBack,
			beforeActive : beforeActive,
			activeCallBack : activeCallBack,
			beforeDell : beforeDell,
			delCallBack : delCallBack,
			txtCallBack : txtCallBack
		});
		tabControl.init(aryTitle);
		if (aryLen > 1) {
			editor.setContent(aryForm[0]);
		};
	};
	//添加tab页面的回调
	function addCallBack() {
		var curPage = tabControl.getCurrentIndex();
		var str = "新页面";
		var idx = curPage - 1;
		formContainer.insertForm(str, "", idx);
		saveTabChange(idx-1,idx);		
	};
	//切换tab之前，返回false即中止切换
	function beforeActive(prePage) {
		if (FormDef.isSourceMode) {
			$.ligerDialog.warn('不能在源代码模式下切换页面',"提示信息");
			return 0;
		}
		return 1;
	};
	//表单或者标题发生变化是保存数据。
	function saveChange() {
		var index = tabControl.getCurrentIndex() - 1;
		var title = tabControl.currentTab.text();
		var data = editor.getContent();
		formContainer.setForm(title, data, index);
	}
	//切换激活tab时执行。
	function activeCallBack(prePage, currentPage) {
		if (prePage == currentPage)
			return;
		//保存上一个tab的数据。
		saveTabChange(prePage - 1, currentPage - 1);
	};
	//在删除页面之前的事件，返回false即中止删除操作
	function beforeDell(curPage) {
		if (FormDef.isSourceMode) {
			$.ligerDialog.warn('不能在源代码模式下删除页面',"提示信息");
			return 0;
		}
		return 1;
	};
	//点击删除时回调执行。
	function delCallBack(curPage) {
		formContainer.removeForm(curPage - 1);
		var tabPage = tabControl.getCurrentIndex();
		setDataByIndex(tabPage - 1);
	};
	//文本返回
	function txtCallBack() {
		var curPage = tabControl.getCurrentIndex();
		var idx = curPage - 1;
		var title = tabControl.currentTab.text();
		//设置标题
		formContainer.setFormTitle(title, idx);
	};
	//根据索引设置数据
	function setDataByIndex(idx) {
		if (idx == undefined)
			return;
		var obj = formContainer.getForm(idx);
		editor.setContent(obj.form);
		$("b", tabControl.currentTab).text(obj.title);
	};
	//tab切换时保存数据
	function saveTabChange(index, curIndex){
		var data = editor.getContent();
		formContainer.setFormHtml(data, index);
		setDataByIndex(curIndex);
	}
</script>
</head>
<body style="overflow:hidden">
	<div>
		<div class="tbar-title">
			<span class="tbar-label">表单设计</span>
		</div>
		<div class="panel-toolbar">
			<div class="toolBar">
				<div class="group">
					<a class="link save" id="btnSaveForm" href="#"><span></span>保存</a>
				</div>
				<div class="l-bar-separator"></div>
				<div class="group">
					<a class="link run" id="btnNext" href="#"><span></span>下一步</a>
				</div>
				<div class="l-bar-separator"></div>
				<div class="group">
					<a class="link preview" id="btnPreView" href="#"><span></span>预览</a>
				</div>
				<div class="l-bar-separator"></div>
				
				<div class="group">
					<a class="link  del" href="javascript:window.close()"><span></span>关闭</a>
				</div>
			</div>
		</div>
	</div>
	<div  class="panel-body">
		<form id="bpmFormDefForm" method="post" name="bpmFormDefForm">
			<input id="formDefId" type="hidden" name="formDefId" value="${bpmFormDef.formDefId}" /> 
			<input id="categoryId" type="hidden" name="categoryId" value="${bpmFormDef.categoryId}" />
			<input id="tabTitle" type="hidden" name="tabTitle" value=""/>
		
			<table cellpadding="0" cellspacing="0" border="0" style=" margin-bottom:4px;"  class="table-detail">
				<tr style="height:25px;">
					<th>表单标题:</th>
					<td>&nbsp;<input id="subject" type="text" name="subject" value="${bpmFormDef.subject}" validate="{required:true}" class="inputText" style="width:80%" /></td>
					<th>表单描述:</th>
					<td>&nbsp;<input id="formDesc" type="text" name="formDesc"	value="${bpmFormDef.formDesc}" class="inputText" style="width:80%" /></td>
					<c:if test="${bpmFormDef.tableId>0}">
						<th>表描述:</th>
						<td style="padding: 2px;">
							<input id="tableComment" type="text" name="tableComment"  class="inputText" value="${bpmFormTable.tableDesc }" />
						</td>
						<th>表名:</th>
						<td style="padding: 2px;">
							<c:choose>
								<c:when test="${canEditColumnNameAndType }">
									<input id="tableName" type="text" name="tableName" class="inputText" validate="{required:true,variable:true}" value="${bpmFormTable.tableName }"  />	
								</c:when>
								<c:otherwise>
									<input id="tableName" type="text" name="tableName"  readonly="readonly" class="inputText" validate="{required:true,variable:true}" value="${bpmFormTable.tableName }"  />
								</c:otherwise>
							</c:choose>
							
						</td>
					</c:if>
					
				</tr>
			</table>
		
			<div title="表单设计">
				<div id="editor" position="center"  style="overflow:hidden;height:100%;">
					<textarea id="txtHtml" name="html">${fn:escapeXml(bpmFormDef.html) }</textarea>
					<textarea id="content" name="content" style="display:none;"></textarea>
					<div id="pageTabContainer"></div>
				</div>
			</div>		
		</form>	
	</div>	
</body>
</html>

