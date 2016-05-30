<%@tag import="com.deelon.core.util.AppUtil"%>
<%@tag import="com.deelon.crowdfunding.model.backstage.Tcproject"%>
<%@tag import="com.deelon.crowdfunding.service.front.HomePageService"%>
<%@tag import="com.deelon.loan.model.sysManager.TSetHomepage"%>
<%@tag import="com.deelon.loan.service.front.HomeIndexPageService"%>
<%@tag import="java.math.BigDecimal"%>
<%@tag import="java.math.RoundingMode"%>
<%@tag import="java.util.List"%>
<%@tag pageEncoding="utf-8"%>
<%@ attribute name="menupath" required="true" description="热门项目"%>
<%
		StringBuffer sb = new StringBuffer("");
		HomeIndexPageService homePageService=(HomeIndexPageService)AppUtil.getBean(HomeIndexPageService.class);
		TSetHomepage homepageMoudle = homePageService.getHomePageMoudleByCode("hotProjects");//获取热门项目
		if(null!=homepageMoudle&&homepageMoudle.getIsVisiable()==1){
			int len = 0 == homepageMoudle.getRecords() ? 12 : homepageMoudle.getRecords();
			HomePageService pageService = (HomePageService) AppUtil.getBean(HomePageService.class);
			List<Tcproject> list = pageService.getTcprojectsByViewHot(len);
			if(len>list.size())
				len=list.size();
//			int len=0;
//			if(list.size()>homepageMoudle.getRecords()){
//				len=homepageMoudle.getRecords();
//			}
//			else{
//				len=list.size();
//			}

%>
<div class="ink-grid push-center all-90">
	<div class="title">
		<h3><i class="fa fa-th-large"></i> <%=homepageMoudle.getRdesc_name()%></h3>
		<a class="ink-button blue push-right" href="${ctx}/crowdfunding/front/tofinancingPro.ht" target="_blank">查看更多</a>
	</div>
	<div class="column-group horizontal-gutters">
<%
			for(int i=0;i<len;i++){
				Tcproject tcproject=(Tcproject)list.get(i);
/* 				tcproject.getPpic();  */
			    
				String url="";
				
				List<Long> ids = tcproject.getFileIdList();
				
				if(!(null == ids) && !ids.isEmpty()){
					Long fileId= ids.get(0);
			    	url=application.getAttribute("PLATFORM-SYSTEM-URL")+"/wuyouchou/system/sysFile/getFileById.ht?fileId="+fileId;
			    }else{
			    	url=application.getAttribute("ctx")+"/crowdfunding/Skin/Default/images/zwtp1.jpg";
			    }
				int pcomplete = 0;
				if(tcproject.getPcomplete() > 100) {
					pcomplete = 100;
				} else {
					pcomplete = tcproject.getPcomplete();
				}
%>
	<div class="xlarge-25 large-33 medium-33 small-50 tiny-100">
		<div class="card">
			<div class="link-pic">
				<a target="_blank" href="${ctx}/crowdfunding/front/toProDetails.ht?projectId=<%=tcproject.getProjectId()%>">
					<img src="<%=url%>">
				</a>
			</div>
			<a class="title" title="<%=tcproject.getPname()%>" target="_blank" href="${ctx}/crowdfunding/front/toProDetails.ht?projectId=<%=tcproject.getProjectId()%>"><%=tcproject.getPname()%></a>
			<div class="desc">
				<p class="text"><%=tcproject.getPdetail()%></p>
				<p class="funded">已融金额<em><%=tcproject.getPinvestAmount().divide(new BigDecimal(10000), 0 , RoundingMode.UP)%></em>万</p>
				<div class="outter">
					<div class="column-group">
						<div class="all-50 provinceCity" title="<%=tcproject.getPprovincesName() + tcproject.getPcityIname()%>">
							<%=tcproject.getPprovincesName() + tcproject.getPcityIname()%>
						</div>
						<div class="all-50 align-right">
							剩余<%=tcproject.getLastDays()%>天
						</div>
					</div>
					<div class="progress-bar"><span class="progress" style="width: <%=pcomplete%>%;"><%=tcproject.getPcomplete()%>%</span></div>
					<div class="column-group">
						<div class="all-50">
							融资目标<em><%=tcproject.getPfinancingAmount().divide(new BigDecimal(10000), 0 , RoundingMode.UP)%></em>万
						</div>
						<div class="all-50 align-right">
							<%--出让股份<em><%=yijiazhong%></em>--%>
							单投资人<p style="margin:0;">最低出资<%=tcproject.getSingleMinAmount()%>万
						</div>
					</div>
					<div class="column-group card-bottom">
						<div class="all-33 align-left">
							关注：<%=tcproject.getPfavoritesCount()%>
						</div>
						<div class="all-33 align-center">
							约谈：<%=tcproject.getAboutNum()%>
						</div>
						<div class="all-33 align-right">
							认购：<%=tcproject.getPinvestCount()%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<%
			}
		%>
	</div>
</div>
<%
	}
%>