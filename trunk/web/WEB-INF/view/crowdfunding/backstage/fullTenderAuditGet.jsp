<%@page language="java" pageEncoding="UTF-8"%>
<%@include file="/commons/include/html_doctype.html"%>
<html>
<head>
	<title>流标</title>
	<%@include file="/commons/include/form.jsp" %>
	<f:link href="Aqua/css/ligerui-all.css"></f:link>
	<f:link href="tree/zTreeStyle.css"></f:link>
	<script type="text/javascript" src="${ctx}/js/lg/plugins/ligerTab.js" ></script>
	<script type="text/javascript" src="${ctx}/js/deelon/displaytag.js" ></script>
	<script type="text/javascript" src="${ctx}/js/lg/plugins/ligerWindow.js" ></script>
   <script type="text/javascript"  src="${ctx}/js/deelon/platform/system/SysDialog.js"></script>
   <script type="text/javascript" src="${ctx}/js/deelon/platform/system/FlexUploadDialog.js"></script>
	<script type="text/javascript">
	/*
	var h;
	var expandDepth =2; 
	
	var action="${action}";
   
	$(function(){
		function showRequest(formData, jqForm, options) { 
			return true;
		} 
		
		function showResponse(responseText, statusText)  { 
    		var self=this;
    		var obj=new com.deelon.form.ResultMessage(responseText);
    		if(obj.isSuccess()){//成功
    			$.ligerDialog.confirm( obj.getMessage()+",是否继续操作","提示信息",function(rtn){
    				if(rtn){
    					if(self.isReset==1){
    						window.location.reload(true);
    					}
    				}else {
    					window.location.href="${returnUrl}";
    				}
    			});
    			
    	    }else{//失败
    	    	$.ligerDialog.error( obj.getMessage(),"出错了");
    	    }
    	}
		$(".link.back").attr("href","list.ht");
		if(${TSetHomepage.homePageId==null}){
			valid(showRequest,showResponse,1);
			
		}else{
			valid(showRequest,showResponse);
		}
		
		
		
		$("a.save").click(function() {
			$('#tSetHomepageForm').submit(); 
		});
	});
	
	*/
 
	function saveDatas(){
			var pbreakRemark=$("#pbreakRemark").val();
			if(pbreakRemark==''){
				 $.ligerDialog.warn("请输入流标原因!");
				 return ;
			}
			var projectId=$("#projectId").val();
			var ListSize=$("#ListSize").val();
		    var flag = true;
			var url="${ctx}/crowdfunding/backstage/fullTenderAudit/saveBreakRemark_Bak.ht";
			if(eval(ListSize)>0){
				var pbreakRemark = escape(encodeURIComponent(pbreakRemark));
			window.location.href="${ctx}/crowdfunding/backstage/fullTenderAudit/saveBreakRemark_.ht?projectId="+projectId+"&pbreakRemark="+pbreakRemark;
			flag = false;
			}
			if(flag){
				var rep=$.ajax({  
			        type: "POST",  
			        url:url ,
			        data: { pbreakRemark:pbreakRemark,projectId:projectId }  
			        });  
			      
			    rep.done(function( data ){  
			       	//	 $.ligerDialog.warn(data.msg);
			       		
			       		var obj=new com.deelon.form.ResultMessage(data);
						if(obj.isSuccess()){
							$.ligerDialog.success("操作成功!","提示信息",function(rtn){
							//	location.href="${ctx}/crowdfunding/backstage/fullTenderAudit/list.ht";
								closewin();
							});
						}else{
							$.ligerDialog.err("提示信息","操作失败!",obj.getMessage());
						}
			      
			        });  
			      
			    rep.fail(function( jqXHR, textStatus ) {  
			        $.ligerDialog.warn(textStatus);
			    }); 
			}
		 
	}
	
	function backList(){
		//location.href="list.ht";
		closewin();
	}
	function closewin(){
		this.window.close();
		
	}
	
	
	</script>
<style type="text/css">
	html{height:100%}
	body {overflow:auto;}
div.panel-body {
    margin: 0px;
}
</style>
</head>
<body>
<div class="panel">
		<div class="panel-top">
			<div class="tbar-title">
				<span class="tbar-label">
					流标
				</span>
			</div>
			<div class="panel-toolbar">
				<div class="toolBar">
					<div class="group"><a class="link save"  id="dataFormSave" href="javascript:saveDatas();"><span></span>保存</a></div>
					<div class="l-bar-separator"></div>
					<div class="group"><a class="link" id="backList_id" href="javascript:backList();"><span></span>返回</a></div>
					<div class="l-bar-separator"></div>
				</div>
			</div>
		</div>
	   <form id="tSetHomepageForm" method="post" action="save.ht">
						
			         
			           		<table class="table-detail"  cellpadding="0" cellspacing="0" border="0">
								<tr>
									
									<th width="18%">项目名称: <span class="required">*</span></th>
									<td >
									<%-- <input type="text"  readonly="readonly" value="${Tcproject.pname}" style="width:240px !important" class="inputText"/> --%>
									<label>${Tcproject.pname}</label>
									</td>
								</tr>
								<tr>
									
									<th width="18%">融资金额: <span class="required">*</span></th>
									<td >
									<%-- <input type="text"  readonly="readonly" value="${Tcproject.ploan}" style="width:240px !important" class="inputText"/> --%>
										<label><fmt:formatNumber value="${Tcproject.pfinancingAmount }" pattern="###,###.##"  minFractionDigits="2"  ></fmt:formatNumber></label>
									</td>
								</tr>
								
								<tr>
									
									<th width="18%">认投金额: <span class="required">*</span></th>
									<td >
									<%-- <input type="text"  readonly="readonly" value="${Tcproject.ploanReal}" style="width:240px !important" class="inputText"/> --%>
									<label><fmt:formatNumber value="${Tcproject.pinvestAmount}" pattern="###,###.##"  minFractionDigits="2"  ></fmt:formatNumber></label>
									</td>
								</tr>
								
								<tr>
									
									<th width="18%">完成进度: <span class="required">*</span></th>
									<td >
									<%-- <input type="text"  readonly="readonly" value="${Tcproject.pcomplete}%" style="width:240px !important" class="inputText"/> --%>
									<label>${Tcproject.pcomplete}</label>
									</td>
								</tr>
														
								<tr height="100">
								   <th>流标说明: </th>
								   <td >
								   	<textarea rows="6" cols="20" name="pbreakRemark" id="pbreakRemark" ></textarea>
								   </td>
								</tr>
														
							</table>
							<input type="hidden" id="projectId" name="projectId" value="${Tcproject.projectId}" />
							<input type="hidden" id="ListSize" name="ListSize" value="${ListSize}" />
					
	          
	  </form>
	  <c:if test="${not empty tprojectList }">
	  <div class="panel-body" title="项目付款情况">
					
					<div class="panel-data" title="项目付款情况">
				    	<%-- <c:set var="checkAll">
							<input type="checkbox" id="chkall"/>
						</c:set> --%>
					    <display:table name="tprojectList" id="tprojectItem" requestURI="list.ht" sort="external" cellpadding="1" cellspacing="1"   class="table-grid">
							<display:column title="${checkAll}" media="html" style="width:30px;text-align:center;">
								  <input type="checkbox" class="pk" name="projectId" id="projectId" value="${tprojectItem.projectId}"}>
							</display:column>
							<display:column property="pname" title="项目名称" sortable="false" sortName="pname" style="text-align:left"/> 
							
							<display:column property="realName" title="跟投会员" sortable="false" sortName="realName" style="text-align:left"/>
							<display:column  title="是否通过<br>创业者审核" sortable="false" sortName="piisCheck" style="text-align:left">
								<c:if test="${tprojectItem.piisCheck eq '1'}">已通过</c:if>
								<c:if test="${tprojectItem.piisCheck eq '0'}"><p style="color: red">待审核</p></c:if>
							</display:column>
							
							 
							<display:column  title="跟投日期" sortable="false" sortName="piinvestTime" style="text-align:left;width:15%;">
								<fmt:formatDate value="${tprojectItem.piinvestTime}" pattern="yyyy-MM-dd"></fmt:formatDate> 
							</display:column>
							
							<display:column title="跟投金额" sortable="false" sortName="piinvest" style="text-align:left;width:19%;"> 
								<fmt:formatNumber value="${tprojectItem.piinvest }" pattern="###,###.##"  minFractionDigits="2"  />
							</display:column>
							<display:column title="是否领投" sortable="false" sortName="piisLeader" style="text-align:left;width:10%;"> 
								<c:if test="${tprojectItem.piisLeader eq '0' }">否</c:if>
								<c:if test="${tprojectItem.piisLeader eq '1' }">是</c:if>
							</display:column>	
							<display:column  title="是否完成打款" sortable="false" sortName="piisPay" style="text-align:left">
								<c:if test="${tprojectItem.piisPay eq '0' }"><span style="color: red;">未打款</span></c:if>
								<c:if test="${tprojectItem.piisPay eq '1' }">已打款</c:if>
							</display:column>
							
							<%-- <display:column title="操作" media="html" style="width:14%;">
								<c:if test="${tprojectItem.piisPay eq '0' }">
									<a href='javascript:void(0)' onclick="doSendMsg('${tprojectItem.projectId}','${tprojectItem.userId}','${tprojectItem.piisCheck}')" class="link edit">通知打款</a>
								</c:if>
							 <c:if test="${tprojectItem.piisPay eq '1' }">
							 	已打款
							 </c:if>
								
							</display:column> --%>
						</display:table>
						<deelon:paging tableId="projectId"/>
					</div>
				</div>
	  </c:if>
	  
	  
	  
</div>
</body>
</html>
