<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.model.Member"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Goods"%>
<%@page import="com.model.Car"%>
<%@page import="com.model.Score"%>
<%@page import="com.model.Producttype"%>
<%@page import="com.model.Jubao"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>被举报管理</title>
<link rel="stylesheet" href="/productauctionssh/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="/productauctionssh/e/css/box.all.css" type="text/css"></link>

<script src="/productauctionssh/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<link href="/productauctionssh/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   
    <link href="/productauctionssh/admin/css/menu.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/productauctionssh/webui/jquery/jquery-1.9.0.js"></script>
     <link href="/productauctionssh/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="/productauctionssh/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="/productauctionssh/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="/productauctionssh/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="/productauctionssh/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/productauctionssh/layer/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/productauctionssh/layer/layer.js"></script>





</head>
<body>
<%
Member member = (Member)session.getAttribute("member");
CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
Member m = (Member)dao.findById(member.getId(),"Member");
 %>
	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="myindex.jsp">会员中心</a>
		</div>
	</div>


	<div class="fn-clear"></div>

		<div class="wrap">
		
		   <div class="main">
		   <jsp:include  page="menu.jsp"></jsp:include>
		       <div class="main-content" style="width: 84.3%;margin-left: 174px;">
		       <div class="search-title">
					  <h2>被举报管理</h2>
                </div>
		       <!--  -->
					   <table id="module" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table" style="margin-top: 10px;">
		<thead>
			<tr>
			    <th><b>举报人</b>
				</th>
				<th><b>拍品名称</b>
				</th>
				<th><b>图证</b>
				</th>
				<th><b>举报说明</b>
				</th>
				<th><b>处理意见</b>
				</th>
			</tr>
		</thead>
		<tbody>
<%
String hql="from Jubao where saleid='"+m.getId()+"'";
String url="jubaolist.jsp?1=1";
PageManager pageManager = PageManager.getPage(url,10, request);
pageManager.doList(hql);
PageManager bean= (PageManager)request.getAttribute("page");
ArrayList<Jubao> list=( ArrayList<Jubao>)bean.getCollection();
%>
<%if(list.size()==0){ %>		
					 
					 <tr>
								<td colspan="20">没有相关举报信息</td>
					 </tr>
<%
}else{ for(Jubao jubao:list){
Goods g = (Goods)dao.findById(jubao.getGoodsid(),"Goods");
Member mmm = (Member)dao.findById(jubao.getMemberid(),"Member");
%>				 
							<tr>
							    <td><%=mmm.getUname() %></td>
							    <td><a href="salegoodsx.jsp?goodsid=<%=g.getId() %>"><%=g.getGoodsname() %></a></td>
							    <td><img src="<%=jubao.getFilename() %>" id="showimg"   width="50" height="50" onclick="showbig('<%=jubao.getFilename() %>')"/></td>
								<td><%=jubao.getContent() %></td>
								<td><%=jubao.getHfmember().equals("")?"等待处理结果":jubao.getHfmember()%></td>
							</tr>
<%}} %>		
                            <tr>
                              <td colspan="10" align="left">${page.info }</td>
                            </tr>	
		</tbody>
	</table>
		<!--  -->			   
					 
	  
			    </div>
		   </div>
			
		</div>
		


	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>
</body>
<script type="text/javascript">
function showbig(url){
$("#showimg").attr("src", url);
var height = $("#displayimg").height();
var width = $("#displayimg").width();
layer.open({
  type: 1,
  title: false,
  closeBtn: 0,
  area: [width + '200', height + '100'],
  skin: 'layui-layer-nobg', //没有背景色
  shadeClose: true,
  content: "<img alt=" + name + " title=" + name + " src=" + url + " />"
});
}


<%
String suc = (String)request.getAttribute("suc");
if(suc!=null){
%>
layer.msg('<%=suc%>');
<%}%>
</script>
</html>