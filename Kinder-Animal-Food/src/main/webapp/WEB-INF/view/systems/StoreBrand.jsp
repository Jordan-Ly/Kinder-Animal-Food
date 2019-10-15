<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<style type="text/css">
p {
	font-family: Arial
}

a {
	text-decoration: none;
}

a:link {
	color: white;
}

a:visited {
	color: white;
}

a:hover {
	color: white;
}

a:active {
	color: white;
}

#HWHP a {
	font-family: "华文琥珀";
}

#Arial a {
	font-family: "Arial";
}

#Black a {
	color: black;
	font-family: "Arial";
}
</style>
<title>StoreDetails</title>
</head>
<body>

	<!--Navigation Bar-->

	<table width=100% height="100" border="0" bgcolor="#4a4a48">
		<tr>
			<td align="center">
				<div id="HWHP">
					<a href="/Kinder-Animal_food/systems/" style="font-size: 40px">Kinder
						Animal Food</a>
				</div>
			</td>
			<td>&nbsp;</td>
			<td align="right">
				<div id="Arial">
					<a href="#" style="font-size: 25px">ABOUT THE SERVER</a>
				</div>
			</td>
			<td>&nbsp;</td>
			<td align="right">
				<div id="Arial">
					<a href="#" style="font-size: 25px">LOGOUT&nbsp;&nbsp;</a>
				</div>
			</td>
		</tr>
	</table>

	<!--Control Panel Start -->

	<table width=100% height=100% bgcolor=white>
		<tr>
			<td valign="top" width="250">
				<table width="250" height="1000" border="0" bgcolor="#4a4a48">
					<tr>
						<td align="center" height="100"><strong><font
								face="Arial" color="white" size="5">CONTROL PANEL</font></strong></td>
					</tr>
					<tr>
						<td align="left" height="40">
							<div id="Arial">
								<a href="#" style="font-size: 15px">&nbsp;&nbsp;&nbsp;Report</a>
							</div>
						</td>
					</tr>
					<tr>
						<td align="left" height="40">
							<div id="Arial">
								<a href="/Kinder-Animal-Food/systems/Insert"
									style="font-size: 15px">&nbsp;&nbsp;&nbsp;Import Data</a>
							</div>
						</td>
					</tr>
					<tr>
						<td align="left" height="40">
							<div id="Arial">
								<a href="/Kinder-Animal-Food/systems/UpdateDeleteBrand"
									style="font-size: 15px">&nbsp;&nbsp;&nbsp;Update/ Delete
									Brand</a>
							</div>
						</td>
					</tr>
					<tr>
						<td align="left" height="40">
							<div id="Arial">
								<a href="/Kinder-Animal-Food/systems/UpdateDeleteStore"
									style="font-size: 15px">&nbsp;&nbsp;&nbsp;Update/ Delete
									Store</a>
							</div>
						</td>
					</tr>
					<tr>
						<td align="left" height="40">
							<div id="Arial">
								<a href="#" style="font-size: 15px">&nbsp;&nbsp;&nbsp;Publish</a>
							</div>
						</td>
					</tr>
					<tr>
						<td align="left" height=500>&nbsp;</td>
					</tr>
				</table>
			</td>
			<!--Control Panel Finish -->
			<!--Store Details  -->
			<td align="left" valign="top" width=100%><c:forEach
					items="${requestScope.stores}" var="s">
					<table bgcolor="#f5f5f5">
						<tr>
							<td width=100% colspan="2" align="left" valign="top">
								<p>${s.getStore_name()}</p>
								<p>${s.getStore_address()}</p>
							</td>
						</tr>
						<tr>
							<td align="left" valign="top">
								<p>
								<div id="Black">
									<a href="../StoreDetails/${s.getStore_id()}">Summary</a>
								</div>
								</p>
								<p>
								<div id="Black">
									<a href="${s.getStore_id()}">Brand</a>
								</div>
								</p>
							</td>

							<td>
								<form method="get" action="StoreBrandDelete/${s.getStore_id()}">
									<!--select all-->
									<input name="" type="button" class="input_hide"
										onClick="AllCheck (this.form);return false;"
										value="select all">
									<!--submit-->
									<div id="Blue">
										<a href="javascript:void(window.open('StoreBrandAdd/${s.getStore_id()}','','height=529, width=700, top=265,left=645, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no'))"
												target="_self">Add Brand To Store</a >
									</div>
									<input type="submit" value="Delete Brand">
									<hr>
									<table border="0">
										<tr>
											<td width="500">Brand Name</td>
											<td width="80">Category</td>
											<td width="200">Delete Brand</td>
										</tr>
										<c:forEach items="${requestScope.brands}" var="b">
											<tr>
												<td>${b.getBrand_name()}</td>
												<td>${b.getBrand_category()}</td>
												<td><input type="checkbox" name="delete"
													value="${b.getBrand_id()}"></td>
											</tr>
										</c:forEach>
									</table>
								</form>
							</td>
						</tr>
					</table>
				</c:forEach></td>
	</table>
	</table>

	<script type="text/javascript">
		// 选择状态
		var selectState = false;
		// 全选或者全取消
		function AllCheck(thisform) {
			for (var i = 0; i < thisform.elements.length; i++) {
				// 提取控件  
				var checkbox = thisform.elements[i];
				checkbox.checked = !selectState;
			}
			selectState = !selectState;
		}

		// 反选
		function ChangeCheck(thisform) {
			// 遍历 form  
			for (var i = 0; i < thisform.elements.length; i++) {
				// 提取控件  
				var checkbox = thisform.elements[i];
				// 检查是否是指定的控件  
				if (checkbox.name === "groupCheckbox"
						&& checkbox.type === "checkbox"
						&& checkbox.checked === false) {
					// 正选  
					checkbox.checked = true;
				} else if (checkbox.name === "groupCheckbox"
						&& checkbox.type === "checkbox"
						&& checkbox.checked === true) {
					// 反选  
					checkbox.checked = false;
				}
			}
		}
	</script>
</body>
</html>

