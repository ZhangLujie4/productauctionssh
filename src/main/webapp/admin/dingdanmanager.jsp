<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="com.dao.CommonDAO"%>
<%@page import="com.util.Info"%>
<%@page import="com.model.Member"%>
<%@page import="com.util.PageManager"%>
<%@page import="com.model.Goods"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>拍卖信息</title>
		<meta http-equiv=”Content-Type” content=”text/html; charset=UTF-8” />
    <link href="/productauctionssh/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   
    <link href="/productauctionssh/admin/css/menu.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/productauctionssh/webui/jquery/jquery-1.9.0.js"></script>
     <link href="/productauctionssh/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="/productauctionssh/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="/productauctionssh/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="/productauctionssh/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="/productauctionssh/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet" type="text/css" />
    <script src="/productauctionssh/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             $.dialog.confirm("你确定要注销拍卖信息?", function(){
				             window.location.href=encodeURI('/productauctionssh/admin/dingdanmanager.do?actiontype=delete&id='+id);
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
	 <body >
<%
CommonDAO dao = (CommonDAO)Info.getDao(request,"CommonDAO");
String goodsname = request.getParameter("goodsname")==null?"":request.getParameter("goodsname");
goodsname=Info.getUTFStr(goodsname);
 %>
			   <div class="search-title">
					  <h2>
	                       拍卖管理
	                </h2>
                <div class="description">
                    
                </div>
              </div>
					<!-- 搜索控件开始 -->
					  <div class="search-options">
					  <form id="searchForm"  action="/productauctionssh/admin/dingdanmanager.jsp" method="post" >
					   <table  cellspacing="0" width="100%">
					        <tbody>
					          <tr>
					             <td>
					               拍品名称
                                            <input name="goodsname" value="<%=goodsname %>"  class="input-txt" type="text" id="goodsname"  />
					                 <div class="ui-button">
					                    <input type="submit" value="搜索" id="btnSearch" class="ui-button-text" /> 
					                 </div>
					             </td>
					          </tr>
					        </tbody>
					   </table>
					   </form>
					</div>
					<!-- 搜索控件结束 -->
					<div class="clear">
					</div>
	<table id="module" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				
				<th><b>拍品名称</b>
				</th>
				<th><b>得主</b>
				</th>
				<th><b>最高竞价</b>
				</th>
				<th><b>税收</b>
				</th>
				<th><b>实付金额</b>
				</th>
				<th><b>付款状态</b>
				</th>
				<th><b>发货状态</b>
				</th>
				<th><b>收货状态</b>
				</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
		
		     <%
String hql="from Goods where memberid!='' and dddelstatus='0'";
String url="dingdanmanager.jsp?1=1";
if(goodsname!=null){
hql+=" and goodsname like '%"+goodsname+"%'";
url+="&goodsname="+goodsname;
}
hql+=" order by id desc";
PageManager pageManager = PageManager.getPage(url,10, request);
pageManager.doList(hql);
PageManager bean= (PageManager)request.getAttribute("page");
ArrayList<Goods> list=( ArrayList<Goods>)bean.getCollection();
					     
					        
					        if(list.size()==0){
					        	
					 %>
					 
					 <tr>
								<td colspan="20">没有相关拍卖信息</td>
					 </tr>
					 
					 <%
					        	
					        	
					        }
					        
					        
					        for(Goods goods :list){
					        
					   Member member = (Member)dao.findById(goods.getMemberid(),"Member");
					   %>
					
					
						
							<tr>
								<td><%=goods.getGoodsname() %></td>
								<td><%=member.getRealname()%></td>
								<td><%=goods.getMaxprice() %></td>
								<td><%=goods.getShuishou() %></td>
								<td><%=goods.getTotal() %></td>

								<td><%=goods.getFkstatus() %></td>
								<td><%=goods.getFhstatus() %></td>
								<td><%=goods.getShstatus() %></td>
								
								<td>
								
								  <%
								    if(goods.getFhstatus().equals("等待发货")&&goods.getFkstatus().equals("已付款")){
								  %>
								   <a href="faHuo.action?id=<%=goods.getId()%>">发货</a>
								  <%} %>
								  <%if(goods.getShstatus().equals("已签收")){ %>
								  <a href="ddinfoDel.action?id=<%=goods.getId()%>">删除</a>
								  <%} %>
								</td>
							</tr>
						
						
						<%}
					  %>
						
					   <tr>
                              <td colspan="7" align="left">${page.info }</td>
                            </tr>
			
			
		</tbody>
	</table>
	<div class="clear"></div>
						<daowen:pager id="pager1"  attcheform="searchForm" />
	</body>
</html>
