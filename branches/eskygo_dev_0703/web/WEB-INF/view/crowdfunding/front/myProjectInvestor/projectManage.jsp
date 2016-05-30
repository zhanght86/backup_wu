<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/includeFront/taglibs.jsp"%>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<title>项目管理</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ include file="/crowdfunding/globalcss.jsp"%>
	<link rel="stylesheet" href="<h:static type="css" src="/crowdfunding/resources/css/projectManage.css" />" type="text/css">
	<script type="text/javascript">
		var _ctx="${ctx}", isLogin;
	</script>
</head>
<body class="iframe">
<div id="projectManage" class="all-100 push-center">
    <div class="ink-tabs top">
        <ul class="tabs-nav">
            <li class="active"><a class="tabs-tab" href="${ctx}/crowdfunding/front/tcprojectinvest/collectProj.ht" target="projectIframe">收藏的项目</a></li>
            <li><a class="tabs-tab" href="${ctx}/crowdfunding/front/tcprojectinvest/aboutProj.ht" target="projectIframe">约谈的项目</a></li>
            <li><a class="tabs-tab" href="${ctx}/crowdfunding/front/tcprojectinvest/leadProj.ht" target="projectIframe">领投的项目</a></li>
            <li><a class="tabs-tab" href="${ctx}/crowdfunding/front/tcprojectinvest/voteProj.ht" target="projectIframe">跟投的项目</a></li>
            <li><a class="tabs-tab" href="${ctx}/crowdfunding/front/tcprojectinvest/finishProj.ht" target="projectIframe">完成的项目</a></li>
            <li><a class="tabs-tab" href="${ctx}/crowdfunding/front/tcprojectinvest/refuseProj.ht" target="projectIframe">拒绝的认投</a></li>
        </ul>
        <div class="tabs-content">
            <c:if test="${flag=='voteTou'}">
                <iframe src="${ctx}/crowdfunding/front/tcprojectinvest/voteProj.ht" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="100%" height=100% id="projectIframe" name="projectIframe" onLoad="iFrameHeight()" ></iframe>
            </c:if>
            <c:if test="${empty flag}">
                <iframe src="${ctx}/crowdfunding/front/tcprojectinvest/collectProj.ht" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="100%" height=100% id="projectIframe" name="projectIframe" onLoad="iFrameHeight()" ></iframe>
            </c:if>
        </div>
    </div>
</div>
<%@ include file="/crowdfunding/globaljs.jsp"%>
<script src="<h:static type="js" src="/crowdfunding/resources/js/projectManage.js" />"></script>
</body>
</html>