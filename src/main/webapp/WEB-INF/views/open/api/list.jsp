<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>REST API</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/jquery.ext.css" />

<script type="text/javascript"
	src="<%=request.getContextPath()%>/vendors/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/vendors/jquery/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/common/common.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/common/laytpl.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/vendors/layer/layer.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/vendors/layer/extend/layer.ext.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/common/jquery.ext.js"></script>

<style type="text/css">
a.plain {
	color: blue;
	text-decoration: none;
}

table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 1;
	border: 1px solid gray;
	table-layout: fixed;
}

table tr {
	height: 30px;
}

table tr th {
	background-color: #EFEFEF;
}

table tr th, table tr td {
	text-align: left;
	vertical-align: middle;
}

table tr th.label, table tr td.label {
	padding-left: 4px;
	width: 100px;
}

table tr th.label2, table tr td.label2 {
	padding-left: 4px;
	width: 200px;
}
</style>
</head>
<body>
	<br /> REST API - 列表
	<hr />
	<table id="listTable" border="1">

	</table>


</body>
<script type="text/javascript">
	Ajax.baseUrl = "<%=request.getContextPath()%>";
	//
	function renderList(dataList) {
		var tplHtml = $id("list_template").html();
		//
		var theTpl = laytpl(tplHtml);
		var htmlStr = theTpl.render(dataList);
		//
		$id("listTable").html(htmlStr);
	}
	$(function() {

		var ajax = Ajax.get("/restApi/list");
		ajax.done(function(result) {
			if (result.type == "info") {
				renderList(result.data);
			} else {
				Layer.msgWarn(result.message);
			}
		});
		ajax.go();
	});
</script>

<script type="text/html" id="list_template">
	<thead><th>分类</th><th>名称</th><th>映射路径</th><th>说明</th></thead>
	{{# for(var i = 0, len = d.length; i < len; i++){ }}		
    	<tr><td>{{d[i].category}}</td><td>{{d[i].name}}</td><td>{{d[i].mappingPath}}</td><td>{{d[i].desc || ""}}</td></tr>
	{{# } }}
</script>

</html>
