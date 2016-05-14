/**
 * add tab to main.jsp center region
 * 
 * @param title
 * @param url
 */
function addTab(title, url) {
	if ($('#tt').tabs('exists', title)) {
		$('#tt').tabs('select', title);
	} else {
		var content = '<iframe scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
		$('#tt').tabs('add', {
			title : title,
			content : content,
			closable : true
		});
	}
}

/**
 * 弹出操作窗口
 * 
 * @param title
 * @param option
 * @param url
 */
function showForm(title, option) {
	$("#option").val(option);
	$('#fm').form('clear');
	var iconCls;
	if ("edit" == option) {
		var row = $("#tt").datagrid('getSelected');
		if(null == row){
			$.messager.alert('警告', '请选择需要修改的记录！', 'error');
			return false;
		}
		$('#fm').form('reset');
		$("#fm").attr("action",'/stock/edit');
		loadForm();
		$("#submitDiv").show();
	}else if ("view" == option) {
		var row = $("#tt").datagrid('getSelected');
		if(null == row){
			$.messager.alert('警告', '请选择需要查看的记录！', 'error');
			return false;
		}
		//将所有元素置成readonly
		loadForm();
		$("#submitDiv").hide();
	}else{
		$("#fm").attr("action",'/stock/add');
		$("#submitDiv").show();
	}
	$('#dlg').window({
		title : title,
		width : '900',
		height : '400',
		left : '80px',
		top : '50px',
		iconCls : 'icon-edit',
		modal : true,
		closed : false,
		resize:true
	}).window('open');
}

function submitForm() {
	var url = "";
	if($("#option").val() == "edit"){
		url = "/stock/edit";
	}else{
		url = "/stock/add";
	}
	$('#fm').form('submit', {
		dataType : 'json',
		url: url,
		success : function(data) {
			data = $.parseJSON(data);
			if (data.success) {
				parent.$.messager.show({
					title : '成功 ',
					msg : '提交表单成功'
				});
				$('#dlg').window('close');
				$("#tt").datagrid('reload');
				clearForm();
			} else {
				$.messager.alert('警告', '提交表单失败!', 'error');
			}
		}
	});
}

function clearForm() {
	$('#fm').form('clear');
}

function deleteRecord(url) {
	var row = $("#tt").datagrid('getSelected');
	if(null == row){
		$.messager.alert('警告', '请选择需要删除的记录!', 'error');
		return false;
	}
	$.messager.confirm("操作提示", "您确定要删除记录吗？", function(data) {
		if(data){
			$.ajax({
				type : "Post",
				data : {
					id : row.id
				},
				url : url,
				dataType : "json",
				success : function(data) {
					if (data.success) {
						$.messager.show({
							title : '成功 ',
							msg : '删除数据成功！'
						});
						$('#tt').datagrid('reload');
					} else {
						$.messager.alert('警告', '删除数据失败!', 'error');
					}
				},
				error : function(err) {
					$.messager.alert('警告', '删除数据失败!', 'error');
				}
			});
		}
	});
}