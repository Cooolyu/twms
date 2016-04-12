<%@page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/paging/paging-list.js"></script>
	<form action=""></form>
	<ul class="pagination">
		<li><a href="javascript:void(0);" onclick="paging('0')">首页</a></li>
        <li><a href="javascript:void(0);" onclick="paging('${page.prePage==1?page.start:page.start-page.limit }')">上一页</a></li>
        <li><a href="javascript:void(0);" onclick="paging('${page.nextPage<page.totalPages?page.start+page.limit:page.start }')">下一页</a></li>
        <li><a href="javascript:void(0);" onclick="paging('${page.totalPages>1 ? (page.totalPages-1)*page.limit : page.start }')">末页</a></li>  
        <li><a href="javascript:void(0);" style="color: black;cursor: default;">第${page.pageNumber }页</a></li>
        <li><a href="javascript:void(0);" style="color: black;cursor: default;">共${page.totalPages }页</a></li>
        <li><a href="javascript:void(0);" style="color: black;cursor: default;">共${page.total }条记录</a></li>
		<%-- 
         --%>
	</ul>
