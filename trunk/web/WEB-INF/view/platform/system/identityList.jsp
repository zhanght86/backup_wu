<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/commons/include/html_doctype.html" %>
<html>
<head>
	<title>流水号生成管理</title>
	<%@include file="/commons/include/get.jsp" %>
</head>
<body>		
	<div class="panel">
	<div class="hide-panel">
				<div class="panel-top">
					<div class="tbar-title">
						<span class="tbar-label">流水号生成管理列表</span>
					</div>
					<div class="panel-toolbar">
						<div class="toolBar">
							<div class="group"><a class="link search" id="btnSearch"><span></span>查询</a></div>
							<div class="l-bar-separator"></div>
							<div class="group"><a class="link add" href="edit.ht"><span></span>添加</a></div>
							<div class="l-bar-separator"></div>
							<div class="group"><a class="link update" id="btnUpd" action="edit.ht"><span></span>修改</a></div>
							<div class="l-bar-separator"></div>
							<div class="group"><a class="link del"  action="del.ht"><span></span>删除</a></div>
						</div>	
					</div>
					<div class="panel-search">
						<form id="searchForm" method="post" action="list.ht">
								<ul class="row">
										<li><span class="label">名称:</span><input type="text" name="Q_name_SL"  class="inputText" value="${param['Q_name_SL']}"/></li>
										<li><span class="label">别名:</span><input type="text" name="Q_alias_SL"  class="inputText" value="${param['Q_alias_SL']}"/></li>
								</ul>
						</form>
					</div>
				</div>
				</div>
				<div class="panel-body">
						<c:set var="checkAll">
							<input type="checkbox" id="chkall"/>
						</c:set>
					    <display:table name="identityList" id="identityItem" requestURI="list.ht" sort="external" cellpadding="1" cellspacing="1"  class="table-grid">
							<display:column title="${checkAll}" media="html" style="width:30px;">
								  	<input type="checkbox" class="pk" name="id" value="${identityItem.id}">
							</display:column>
							<display:column property="name" title="名称" sortable="true" sortName="name"></display:column>
							<display:column property="alias" title="别名" sortable="true" sortName="alias"></display:column>
							<display:column property="rule" title="规则" sortable="true" sortName="REGULATION"></display:column>
							<display:column  title="生成类型" style="text-align:center" >
								<c:choose>
									<c:when test="${identityItem.genType==1}">
										<span class="green">每天生成</span>
									</c:when>
									<c:when test="${identityItem.genType==2}">
										<span class="green">每月生成</span>
									</c:when>
									<c:when test="${identityItem.genType==3}">
										<span class="green">每年生成</span>
									</c:when>
									<c:otherwise>
										<span class="red">递增</span>
									</c:otherwise>
								</c:choose>
							</display:column>
							<display:column property="noLength" title="流水号长度" sortable="true" sortName="noLength"></display:column>
							<display:column property="initValue" title="初始值" sortable="true" sortName="initValue"></display:column>
						
							<display:column title="管理" media="html"  style="width:180px;text-align:center">
								<f:a alias="delSerialNo" href="del.ht?id=${identityItem.id}" css="link del">删除</f:a>
								<a href="edit.ht?id=${identityItem.id}" class="link edit">编辑</a>
								<a href="get.ht?id=${identityItem.id}" class="link detail">明细</a>
							</display:column>
						</display:table>
						<deelon:paging tableId="identityItem"/>
					
				</div><!-- end of panel-body -->				
			</div> <!-- end of panel -->
</body>
</html>


