<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/includeFront/taglibs.jsp"%>
<%@page import="com.deelon.loan.util.TUserUtil"%>
<%@page import="com.deelon.loan.model.front.TUser"%>
<% 
int count=1;
int count1=1;
int count2=1;
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>收件箱</title>
<meta name="renderer" content="webkit"/>
<%@ include file="/commons/includeFront/javascripts.jsp"%>
<%@ include file="/crowdfunding/cssorjs.jsp"%>
<link rel="stylesheet" href="${ctx }/crowdfunding/Skin/Default/css/Userbackground.css">

<c:set var="ctx" value="${pageContext.request.contextPath}" /> 
<%
TUser  u=TUserUtil.getLogUser( request );
%>
	<script type="text/javascript">
	$(function(){
		<%if(u!=null){ %>
		$.ajax({
			url:"${ctx}/loan/tuserMsgRemind/getTUserMsgCount.ht?typeId=4",
			dataType:'json',
			type:'post',
			success:function(userMsgCount){
				if(userMsgCount){
					var data = userMsgCount;
					if(data && data>0){
						var msgShow;
						if(data>99){
							msgShow = "99+";
						}else{
							msgShow = data;
						}
						$("#userMsg4").text(msgShow);
						$("#num-box4").show();
					}
				}
			}
		});
        <%}%>
	});
	$(function(){
		<%if(u!=null){ %>
		$.ajax({
			url:"${ctx}/loan/tuserMsgRemind/getTUserMsgCount.ht?typeId=5",
			dataType:'json',
			type:'post',
			success:function(userMsgCount){
				if(userMsgCount){
					var data = userMsgCount;
					if(data && data>0){
						var msgShow;
						if(data>99){
							msgShow = "99+";
						}else{
							msgShow = data;
						}
						$("#userMsg5").text(msgShow);
						$("#num-box5").show();
					}
				}
			}
		});
        <%}%>
	});
	
	</script>
<script>
function iFrameHeight() {
    var ifm= document.getElementById("iframepage_1"); 
    var subWeb = document.frames == null && typeof(document.frames) != "undefined"? document.frames["iframepage_1"].document : ifm.contentDocument; 
    if(ifm != null && subWeb != null) { 
        ifm.height = subWeb.body.scrollHeight; 
    } 
}
function iFrameHeight2() {
    var ifm= document.getElementById("iframepage_2");
    var subWeb = document.frames==null  && typeof(document.frames) != "undefined"? document.frames["iframepage_2"].document :ifm.contentDocument;
    if(ifm != null && subWeb != null) {
        ifm.height = subWeb.body.scrollHeight;
    }
}
function iFrameHeight3() {
   var ifm= document.getElementById("iframepage_3");
   var subWeb = document.frames==null  && typeof(document.frames) != "undefined"? document.frames["iframepage_3"].document :ifm.contentDocument;
   if(ifm != null && subWeb != null) {
       ifm.height = subWeb.body.scrollHeight;
    }
}
</script>
</head>
<body style="min-height:650px; ">
<div class="PrDyBack f_l">
		<h2><img src="${ctx}/crowdfunding/Skin/Default/images/headportrait4.png">收件箱</h2>
		<div class="patternPaymentNav">
				<ul>
					<li  id="huankuaning" class="PaPaNavChecked" onclick="loadDates1();">私信	<div style="float:right;display:none;cursor:pointer; position: relative;;" id="num-box1" title="未读信息"  >
        	<div style="float: left;background-image:url(${ctx}/crowdfunding/Skin/Default/images/zuobanyuan.png);height: 18px;width: 8px;background-repeat: no-repeat;"></div>
        	<div style="float: left;height: 18px; line-height: 18px; background-color: #ff5704; color: #fff;" id="userMsg1"></div>
        	<div style="float: left;background-image:url(${ctx}/crowdfunding/Skin/Default/images/youbianyuan.png);height: 18px;width: 8px;background-repeat: no-repeat;"></div>
        </div> </li>
					<li id="huankuaned"  onclick="loadDates2();">向我推荐的项目	<div style="float:right;display:none;cursor:pointer; position: relative;;" id="num-box4" title="未读信息"  >
        	<div style="float: left;background-image:url(${ctx}/crowdfunding/Skin/Default/images/zuobanyuan.png);height: 18px;width: 8px;background-repeat: no-repeat;"></div>
        	<div style="float: left;height: 18px; line-height: 18px; background-color: #ff5704; color: #fff;" id="userMsg4"></div>
        	<div style="float: left;background-image:url(${ctx}/crowdfunding/Skin/Default/images/youbianyuan.png);height: 18px;width: 8px;background-repeat: no-repeat;"></div>
        </div> </li>
					<li id="huankuaned1"  onclick="loadDates3();">系统通知	<div style="float:right;display:none;cursor:pointer; position: relative;;" id="num-box5" title="未读信息"  >
        	<div style="float: left;background-image:url(${ctx}/crowdfunding/Skin/Default/images/zuobanyuan.png);height: 18px;width: 8px;background-repeat: no-repeat;"></div>
        	<div style="float: left;height: 18px; line-height: 18px; background-color: #ff5704; color: #fff;" id="userMsg5"></div>
        	<div style="float: left;background-image:url(${ctx}/crowdfunding/Skin/Default/images/youbianyuan.png);height: 18px;width: 8px;background-repeat: no-repeat;"></div>
        </div></li>
				</ul>
			</div>
			<!--私信列表-->
			<div >
			 	<iframe src="${ctx}/loan/tuserMsgRemind/getMyPrivateInfos.ht" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="100%" height=100% id="iframepage_1" name="iframepage_1" onLoad="iFrameHeight()" ></iframe>
		    </div>
		   
	</div>
			

	<script type="text/javascript">
	
   function loadDates1(){
		 var url='${ctx}/loan/tuserMsgRemind/getMyPrivateInfos.ht';
		  $("#iframepage_1").attr("src", url);
	  }
   
   function loadDates2(){
		 var url='${ctx}/loan/tuserMsgRemind/myProjectRecommod.ht';
		  $("#iframepage_1").attr("src", url);
	  }
   
   function loadDates3(){
		 var url='${ctx}/loan/tuserMsgRemind/mySystemInfo.ht';
		  $("#iframepage_1").attr("src", url);
	  }
   
   function unReadMsgSet(userMsgCount,num){
		if(userMsgCount!='0'){
			var data = userMsgCount;
			if(data && data>0){
				var msgShow;
				if(data>99){
					msgShow = "99+";
				}else{
					msgShow = data;
				}
				$("#userMsg"+num).text(msgShow);
				$("#num-box"+num).show();
			}
		}else{
			$("#num-box"+num).hide();
		}
	}
   
  
	 $(function(){
		 /**全选复选框单击事件**/
         $("#chkAll").click(function() {
             if (this.checked) {//如果自己被选中
                 $("table tr td input[type=checkbox]").attr("checked", true);
             }
             else {//如果自己没有被选中
                 $("table tr td input[type=checkbox]").attr("checked", false);
             }
         });
         $(".patternPaymentNav li").click(function(){
			  $(this).addClass('PaPaNavChecked').siblings().removeClass('PaPaNavChecked');
			 
		});
		
	  })
	</script>
</body>
</html>