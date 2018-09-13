<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Pingjia"%>
<%@page import="com.model.Member"%>
<%@page import="com.model.Jubao"%>
<%@page import="com.model.Goods"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>举报信息</title>
   <link href="/productauctionssh/admin/css/web2table.css" rel="stylesheet" type="text/css" />
 
    <script type="text/javascript" src="/productauctionssh/webui/jquery/jquery-1.9.0.js"></script>
     <link href="/productauctionssh/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="/productauctionssh/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="/productauctionssh/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="/productauctionssh/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="/productauctionssh/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="/productauctionssh/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
    <script type="text/javascript" src="/productauctionssh/layer/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/productauctionssh/layer/layer.js"></script>
		<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        var idlist = new Array();
			        $(".check:checked").each(function(index,domEle){
			             idlist.push( $(this).attr("value"));
			             $.dialog.confirm("你确定要删除记录?", function(){
				             window.location.href=encodeURI("jubaoDel.action?idlist="+idlist);
				          });
			        });
			    });
			    $("#btnCheckAll").click(function(){
			           var ischeck=false;
			           $(".check").each(function(){
			               if($(this).is(":checked"))
			               {
			                  $(this).prop("checked","");
			                  ischeck=false;
			                }
			               else
			               {
			                  $(this).prop("checked","true");
			                  ischeck=true;
			                }
			           });
			           if($(this).text()=="选择记录")
			              $(this).text("取消选择");
			           else
			              $(this).text("选择记录");
			    })
			});
       </script>
	</head>
<body>
<%
String commentren = request.getParameter("commentren")==null?"":request.getParameter("commentren");
String hql="from Jubao where 1=1";
String url="/productauctionssh/admin/jubaolist.jsp?1=1";
if(!commentren.equals("")){
hql+=" and memberid in (select id from Member where uname like '%"+commentren+"%')";
url+="&commentren="+commentren;
}
 %>
			<div class="search-title">
				<h2>评论管理</h2>
				<div class="description"></div>
			</div>
			<!-- 搜索控件开始 -->
			<div class="search-options">
				<form id="searchForm"
					action="/productauctionssh/admin/jubaolist.jsp"
					method="post">
					<table class="grid" cellspacing="1" width="100%">
						<tbody>
							<tr>
								<td> <input name="commentren" value="<%=commentren %>"
									class="input-txt" type="text" id="commentren" placeholder="举报人用户名..." />
									
										<input type="submit" value="搜索" id="btnSearch"
											class="orange-button" />
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			<!-- 搜索控件结束 -->
			<div class="action-details">
               
                  <a id="btnDelete" class="action-btn" href="#">
	                  <em class="icon-delete"></em>
	                  <b>删除</b>
                  </a>
                
            </div>
			<table id="module" width="100%" border="0" cellspacing="0"
				cellpadding="0" class="ui-record-table">
				<thead>
					<tr>
						<th>选择</th>
						
						<th><b>举报人</b>
						</th>
						<th><b>拍品</b>
						</th>
						<th><b>图证</b>
						</th>
						<th><b>链接</b>
						</th>
						<th><b>举报说明</b>
						</th>
						<th><b>被举报人</b>
						</th>
						<th><b>处理结果</b>
						</th>
						<th><b>操作</b>
						</th>
						
					</tr>
				</thead>
				<tbody>
				<%
				        CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
						String f = request.getParameter("f");
						PageManager pageManager = PageManager.getPage(url,10, request);
   	    				pageManager.doList(hql);
   	    				PageManager bean= (PageManager)request.getAttribute("page");
   	    				ArrayList<Jubao> list=(ArrayList<Jubao>)bean.getCollection();
   	    				if(list.size()==0){
				 %>
						<tr>
							<td colspan="20">没有相关举报信息</td>
						</tr>
					<%}for(Jubao jubao:list){ 
					Member member = (Member)dao.findById(jubao.getMemberid(),"Member");
					Member mmm = (Member)dao.findById(jubao.getSaleid(),"Member");
					Goods g = (Goods)dao.findById(jubao.getGoodsid(),"Goods");
					%>
						<tr>
							<td>&nbsp;
							<input id="chk" class="check" name="chk" type="checkbox" value='<%=jubao.getId() %>'/>
							</td>
							
							<td><%=member.getUname() %></td>
							<td><%=g.getGoodsname() %></td>
							<td><img src="<%=jubao.getFilename() %>" id="showimg"   width="50" height="50" onclick="showbig('<%=jubao.getFilename() %>')"/></td>
							<td><a href="<%=jubao.getUrl() %>" target="black"><%=jubao.getUrl() %></a></td>
							<td><%=jubao.getContent() %></td>
							<td><%=mmm.getUname() %></td>
							<td><%=jubao.getHfmember() %></td>
							<td>
							<%if(jubao.getHfmember().equals("")){ %>
								<a class="回复" href="jubaohf.jsp?id=<%=jubao.getId() %>">回复</a>
						     <%} %>
							</td>
						
						</tr>
					<%} %>
				</tbody>
			</table>
			<div class="clear"></div>
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

			<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
