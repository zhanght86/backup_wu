
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/commons/include/html_doctype.html" %>
<html>
<head>
<title>新建表单</title>
<%@include file="/commons/include/form.jsp" %>
<f:link href="tree/zTreeStyle.css"></f:link>
<script type="text/javascript" src="${ctx}/js/lg/plugins/ligerComboBox.js"></script>
<script type="text/javascript" src="${ctx}/js/tree/jquery.ztree.js"></script>
<script type="text/javascript" src="${ctx}/js/lg/plugins/htCatCombo.js"></script>
<script type="text/javascript" src="${ctx}/servlet/ValidJs?form=bpmFormDef"></script>
<script type="text/javascript" src="${ctx}/js/deelon/platform/form/FormTableDialog.js"></script>
<style type="text/css">
	html,body{height:100%;width:100%; overflow: hidden;}
</style>

<script type="text/javascript">
	window.name="frmEdit";
	var designType="table_create",dType=${designType};
	
	$(function(){
		function showRequest(formData, jqForm, options) {
			return true;
		}
		valid(showRequest,showResponse);		
		$("#dataFormSave").click(function(){
			var rtn=$('#bpmFormDefForm').valid();
			if(!rtn) return;
			if(designType=='table_create'){
				var tableId=$("#tableId").val();
				if(!tableId){
					$.ligerDialog.error("请您选择要生成的表","提示信息");
					return;
				}
				$("#bpmFormDefForm").attr("action","selectTemplate.ht");
			}
			else{
				$("#bpmFormDefForm").attr("action","chooseDesignTemplate.ht");
			}
			$('#bpmFormDefForm')[0].submit();
		});
	
		if(dType==1){
			$("#table_tr").hide();
			designType='editor_design';
		}
			
	});
	
	function selectTable(){
		var callBack=function(tableId,tableName){		
			$("#tableId").val(tableId);
			$("#tableName").val(tableName);
		}
		FormTableDialog({callBack:callBack});
	}
	function resetTable(){
		$("#tableId").val('');
		$("#tableName").val('');
	};
	function designTypeChange(){
		var val = $("input:radio[name='designType']:checked").attr("id");
		if(!val)return;
		designType = val;
		if(designType=="editor_design"){
			$("#table_tr").hide();
		}
		else{
			$("#table_tr").show();
		}
	};
</script>

</head>
<body >
	<div class="panel">
	<div class="hide-panel">
		<div class="panel-top">
			<div class="panel-toolbar">
				<div class="toolBar">
					<div class="group">
						<a class="link run" id="dataFormSave" href="#"><span></span>下一步</a>
					</div>
				</div>
				</div>
			</div>
		</div>
		</div>
		<div class="panel-detail">
			<form  id="bpmFormDefForm" method="post" action="selectTemplate.ht" >
				 
				 <table cellpadding="1" cellspacing="1" class="table-detail">
					<tr>
						<th width="150">表单标题:</th> 
						<td><input id="subject" type="text" name="subject" class="inputText" size="30" value="${subject}" /></td>
					</tr>
					<tr>
						<th width="150">表单类型:</th>
						<td>
							<input class="catComBo" catKey="FORM_TYPE" valueField="categoryId" catValue="${categoryId}" name="typeName" height="150" width="200"/>
						</td>
					</tr>
					<tr>
						<th width="150">表单描述:</th>
						<td>
							<textarea rows="3" cols="35" id="formDesc" name="formDesc" class="textarea">${formDesc}</textarea>
						</td>
					</tr>
					<tr>
						<th width="150">设计类型:</th>
						<td>
							<input id="table_create"  onclick="designTypeChange()" name="designType" type="radio" <c:if test="${designType==0}"> checked="checked"</c:if> /><label for="table_create">通过表生成</label>
							<input id="editor_design" onclick="designTypeChange()" name="designType" type="radio" <c:if test="${designType==1}"> checked="checked"</c:if>  /><label for="editor_design">编辑器设计</label>
						</td>
					</tr>
					<tr id="table_tr">
						<th width="150">表:</th>
						<td style="padding-top: 5px;">
							
							<input type="text" id="tableName" class="inputText" name="tableName" value="" readonly="readonly">
							<input type="hidden" id="tableId" name="tableId" value="">
							<a href='#' class='link search'  onclick="selectTable()" ></a>
							<a href='#' class='link redo' style='margin-left:10px;' onclick="resetTable()"><span>重选</span></a>
						</td>
					</tr>
				</table>
				
			</form>
		</div><!-- end of panel-body -->				
	</div> <!-- end of panel -->
</body>
</html>


