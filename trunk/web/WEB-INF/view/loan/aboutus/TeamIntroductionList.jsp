<%@page import="java.util.List"%>
<%@page import="com.deelon.core.util.AppUtil"%>
<%@page import="com.deelon.cmsform.service.site.CmsSiteMenuContentService"%>
<%@page import="com.deelon.cmsform.model.site.CmsSiteMenuContent"%>
<%@ include file="/commons/includeFront/taglibs.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <link rel="stylesheet" href="${ctx }/styles/p2p/Skin/Default/css/reset.css">
  <link rel="stylesheet" href="${ctx }/styles/p2p/Skin/Default/css/public.css">
    <link rel="stylesheet" href="${ctx }/styles/p2p/Skin/Default/TeamIntroductionList.css"> 
    <script type="text/javascript" src="${ctx}/js/javascripts/jquery-1.11.1.min.js"></script>
        <div class="con">
          <ul>
          <c:forEach items="${cms}" var="cms">
             <li>
             <pageTag:TeanTraversalFileId menupath="${cms.contentFileIds}"/>
              <div>
                <h2>${cms.contentTitle }</h2>
                <p class="mediaReport-p">${cms.contentText}</p>
              </div>
            </li> 
            </c:forEach>
          
          </ul>
          <form action="" name="pageForm" id="pageForm">
<pageTag:paging form="pageForm"/>
</form>
        </div>
     