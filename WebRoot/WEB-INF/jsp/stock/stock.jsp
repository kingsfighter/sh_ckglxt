<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../../js/jquery-easyui-1.4.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../../../js/jquery-easyui-1.4.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../../../js/jquery-easyui-1.4.4/demo/demo.css">
<script type="text/javascript" src="../../../js/jquery-easyui-1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="../../../js/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../../js/main.js"></script>
<script type="text/javascript" src="../../../js/user/user.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品库存管理</title>
<script type="text/javascript">
	function loadForm(){
		var row = $("#tt").datagrid('getSelected');
		$("#id").val(row.id);
		$("#goodsNum").textbox('setValue',row.goodsNum);
		$("#goodsNum").textbox('setText',row.goodsNum);
		$("#goodsName").textbox('setValue',row.goodsName);
		$("#goodsName").textbox('setText',row.goodsName);
		$("#goodsStandard").textbox('setValue',row.goodsStandard);
		$("#goodsStandard").textbox('setText',row.goodsStandard);
		$("#goodsCategory").val(row.goodsCategory);
		$("#goodsPrice").textbox('setValue',row.goodsPrice);
		$("#goodsPrice").textbox('setText',row.goodsPrice);
		$("#goodsDesc").val(row.goodsDesc);
		$("#stockWareName").textbox('setText',row.stockWareName);
		$("#stockWareName").textbox('setValue',row.stockWareName);
		$("#stockShelfName").textbox('setText',row.stockShelfName);
		$("#stockShelfName").textbox('setValue',row.stockShelfName);
		$("#stockCount").textbox('setText',row.stockCount);
		$("#stockCount").textbox('setValue',row.stockCount);
		$("#lastStockInTime").textbox('setText',row.lastStockInTime);
		$("#lastStockInTime").textbox('setValue',row.lastStockInTime);
		$("#lastStockInUser").textbox('setText',row.lastStockInUser);
		$("#lastStockInUser").textbox('setValue',row.lastStockInUser);
		$("#lastStockInCount").textbox('setText',row.lastStockInCount);
		$("#lastStockInCount").textbox('setValue',row.lastStockInCount);
		$("#lastStockOutTime").textbox('setText',row.lastStockOutTime);
		$("#lastStockOutTime").textbox('setValue',row.lastStockOutTime);
		$("#lastStockOutUser").textbox('setText',row.lastStockOutUser);
		$("#lastStockOutUser").textbox('setValue',row.lastStockOutUser);
		$("#lastStockOutCount").textbox('setText',row.lastStockOutCount);
		$("#lastStockOutCount").textbox('setValue',row.lastStockOutCount);
	}
	
	$(document).ready(function(){  
		
	});
</script>
</head>
<body>
	<table id="tt" class="easyui-datagrid" style="width:80%;height:auto;" url="/stock/list"  singleSelect="true" toolbar="#tb" rownumbers="true" pagination="true">
		<thead>
			<tr>
				<th field="goodsNum" width="50">商城编号</th>
				<th field="goodsName" width="100">商品名称</th>
				<th field="goodsStandard" width="100">商品规格</th>
				<th field="goodsCategory" width="100">商品大类</th>
				<th field="goodsPrice" width="100">单价</th>
				<th field="stockWareName" width="200">仓库名称</th>
				<th field="stockShelfName" width="400">货架名称</th>
				<th field="stockCount" width="400">库存</th>
				<th field="goodsDesc" width="400">商品描述</th>
			</tr>                          
		</thead>                           
		<tbody>                            
		</tbody>                           
	</table>
	<div id="tb">
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:showForm('新增商品','add')">增加</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:showForm('修改商品','edit')">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="javascript:deleteRecord('/stock/delete')">删除</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="javascript:showForm('查看商品','view')">查看</a>
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:900px;height:400px;padding:10px 20px"
		closed="true" buttons="#dlg-buttons">
		<form id="fm" method="post" name="fm" action="stock/add">
			<table cellpadding="5">
				<!-- 商品 -->
				<tr>
	    			<td>商品编号:</td>
	    			<td>
	    			<input type="hidden" id="id" name="goodsStock.id">
	    			<input class="easyui-textbox" type="text" id="goodsNum" name="goodsStock.goodsNum" data-options="required:true"></input>
	    			</td>
	    			<td>商品名称:</td>
	    			<td>
	    			<input class="easyui-textbox" type="text" id="goodsName" name="goodsStock.goodsName" data-options="required:true"></input>
	    			</td>
	    			<td>商品规格:</td>
	    			<td>
	    			<input class="easyui-textbox" type="text" id="goodsStandard" name="goodsStock.goodsStandard"></input>
	    			</td>
	    		</tr>
	    		
	    		<tr>
	    			<td>商品大类:</td>
	    			<td>
	    			<select name="goodsStock.goodsCategory" id="goodsCategory">
	    				<option value="">==请选择==</option>
	    				<option value="材料">材料</option>
	    				<option value="五金">五金</option>
	    				<option value="家具">家具</option>
	    				<option value="其他">其他</option>
	    			</select>
	    			</td>
	    			<td>商品单价:</td>
	    			<td>
	    			<input class="easyui-numberbox" precision="2" min="0" max="999999" type="text"  id="goodsPrice" name="goodsStock.goodsPrice" data-options="required:true"></input>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>商品描述:</td>
	    			<td colspan=5><textarea rows="10" cols="50" id="goodsDesc"  name="goodsStock.goodsDesc"></textarea></td>
	    		</tr>
	    		
	    		<!-- 库存 -->
	    		<tr>
	    			<td>仓库名称:</td>
	    			<td>
	    			<input class="easyui-textbox" type="text" id="stockWareName" name="goodsStock.stockWareName" ></input>
	    			</td>
	    			<td>货架名称:</td>
	    			<td>
	    			<input class="easyui-textbox" type="text" id="stockShelfName" name="goodsStock.stockShelfName" ></input>
	    			</td>
	    			<td>商品库存:</td>
	    			<td>
	    			<input class="easyui-numberbox" precision="0" min="0" max="999999" type="text" id="stockCount" name="goodsStock.stockCount" data-options="required:true"></input>
	    			</td>
	    		</tr>
	    		
	    		<!-- 入库 -->
	    		<tr>
	    			<td>最后入库时间:</td>
	    			<td>
	    			<input class="easyui-textbox" type="text" id="lastStockInTime" name="goodsStock.lastStockInTime" ></input>
	    			</td>
	    			<td>最后入库人:</td>
	    			<td>
	    			<input class="easyui-textbox" type="text" id="lastStockInUser" name="goodsStock.lastStockInUser" ></input>
	    			</td>
	    			<td>最后入库数量:</td>
	    			<td>
	    			<input class="easyui-numberbox" precision="0" min="0" max="999999" type="text" id="lastStockInCount" name="goodsStock.lastStockInCount"></input>
	    			</td>
	    		</tr>
	    		<!-- 出库 -->
	    		<tr>
	    			<td>最后出库时间:</td>
	    			<td>
	    			<input class="easyui-textbox" type="text" id="lastStockOutTime" name="goodsStock.lastStockOutTime" ></input>
	    			</td>
	    			<td>最后出库人:</td>
	    			<td>
	    			<input class="easyui-textbox" type="text" id="lastStockOutUser" name="goodsStock.lastStockOutUser" ></input>
	    			</td>
	    			<td>最后出库数量:</td>
	    			<td>
	    			<input class="easyui-numberbox" precision="0" min="0" max="999999" type="text" id="lastStockOutCount" name="goodsStock.lastStockOutCount"></input>
	    			</td>
	    		</tr>
	    		
	    	</table>
		</form>
		<div style="text-align:center;padding:5px" id="submitDiv">
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	    </div>
	    <input type="hidden" id="option" ></input>
	</div>
</body>
</html>