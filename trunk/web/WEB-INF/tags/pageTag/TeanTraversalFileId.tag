<%@tag import="java.io.File"%>
<%@tag import="com.deelon.platform.service.util.ServiceUtil"%>
<%@tag import="com.deelon.platform.controller.system.SysFileController"%>
<%@tag import="com.deelon.platform.model.system.SysFile"%>
<%@tag import="com.deelon.platform.service.system.SysFileService"%>
<%@tag import="com.fr.base.core.json.JSONObject"%>
<%@tag import="com.fr.base.core.json.JSONArray"%>
<%@tag import="com.deelon.cmsform.model.site.CmsSiteMenuContent"%>
<%@tag import="com.deelon.core.util.AppUtil"%>
<%@tag
	import="com.deelon.cmsform.service.site.CmsSiteMenuContentService"%>
<%@tag import="com.deelon.loan.service.front.HomeIndexPageService"%>
<%@tag import="com.deelon.loan.model.sysManager.TSetHomepage"%>
<%@tag pageEncoding="utf-8"%>
<%@ attribute name="menupath" required="true" description="遍历fieldId"%>
<%@tag import="java.util.*"%>
<%
	StringBuffer sb = new StringBuffer("");
	String fileIds = menupath;
	String fileId = fileIds.split(",")[0];
	for (int j = 0; j < 2; j++) {
		int a = fileId.indexOf(":");
		fileId = fileId.substring(a + 1);
	}
	fileId = fileId.replaceAll("'", "");
	String url = application.getAttribute("ctx")
			+ "/platform/system/sysFile/getFileById.ht?fileId="
			+ fileId;
	sb.append("<img src=\"" + url + "\" width=\"155\" height=\"195\" alt=\"\">");
	out.print(sb.toString());
%>