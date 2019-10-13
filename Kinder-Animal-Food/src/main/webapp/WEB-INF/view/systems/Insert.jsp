<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>Insert Data</title>
<meta charset="UTF-8">
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<form:form id="storeInsertForm" modelAttribute="store"
		action="storeInsertProcess" method="post">
		<table align="center">
			<tr>
				<td><form:label path="store_name">store name: </form:label></td>
				<td><form:input path="store_name" name="store_name"
						id="store_name" /></td>
			</tr>
			<tr>
				<td><form:label path="store_address">store address: </form:label></td>
				<td><form:input path="store_address" name="store_address"
						id="store_address" /></td>
			</tr>
			<tr>
				<td><form:label path="store_state">store state: </form:label></td>
				<td><form:input path="store_state" name="store_state"
						id="store_state" /></td>
			</tr>
			<tr>
				<td><form:label path="store_longitude">store longitude: </form:label></td>
				<td><form:input path="store_longitude" name="store_longitude"
						id="store_longitude" /></td>
			</tr>
			<tr>
				<td><form:label path="store_latitude">store latitude: </form:label></td>
				<td><form:input path="store_latitude" name="store_latitude"
						id="store_latitude" /></td>
			</tr>
			<tr>
				<td align="center"><form:button id="storeInsert"
						name="storeInsert">Insert</form:button></td>
			</tr>
		</table>
	</form:form>
	<table align="center">
		<tr>
			<td style="font-style: italic; color: red;">${message}</td>
			<br>
		</tr>
	</table>
	<hr>
	<form:form id="brandInsertForm" modelAttribute="brand"
		action="brandInsertProcess" method="post">
		<table align="center">
			<tr>
				<td><form:label path="brand_name">Brand Name</form:label></td>
				<td><form:input placeholder="Please enter the brand name"
						size="40" path="brand_name" name="brand_name" id="brand_name" />
					<span style="margin-left: 10px; display: none; color: red"
					id="brandNameNull">Please enter the brand name！</span></td>
			</tr>
			<tr>
				<td><form:label path="brand_category">Brand Category</form:label></td>
				<td><form:input placeholder="Please enter the category"
						size="40" path="brand_category" name="brand_category"
						id="brand_category" /><span
					style="margin-left: 10px; display: none; color: red"
					id="brandCategoryNull">Please enter the category！</span></td>
			</tr>
			<tr>
				<td><form:label path="image">image: </form:label></td>
				<td><input type="file" id="imageSelect"
					accept="image/x-png,image/jpeg,image/jpg" /><span
					style="display: none"><form:input path="image" name="image"
							id="image" /></span>
				<div
						style="border: 1px solid #F00; width: 200px; height: 200px; overflow: hidden">
						<img src="" id="img" style="max-width: 200px; max-height: 200px">
					</div></td>
				<tr>
				<td><form:form id="AccreditationInsertForm"
						modelAttribute="accreditation" action="brandInsertProcess"
						method="post">
						<table align="center">
							<tr>
								<td><form:label path="accreditation_name">Accreditation</form:label></td>
								<td><form:input
										placeholder="Please enter the accreditation" size="40"
										path="accreditation_name" name="accreditation_name"
										id="accreditation_name" /><span
									style="margin-left: 10px; display: none; color: red"
									id="accreditationNameNull">Please enter the
										accreditation！</span></td>
							</tr>
							<tr>
								<td><form:label path="rating">Rating</form:label></td>
								<td><form:select path="rating" name="rating" id="rating">
										<option value="best">Best</option>
										<option value="good">Good</option>
										<option value="avoid">Avoid</option>
									</form:select></td>
							</tr>
							<!--tr>
						<td align="center"><form:button id="accreditationInsert"
								name="accreditationInsert">accreditation Insert</form:button></td>
					</tr-->
						</table>
					</form:form></td>
			</tr>
			<tr>
				<td align="center"><button type="button" id="brandInsert"
						name="brandInsert" onclick="submitBrand()">Brand Insert</button></td>
			</tr>
		</table>

	</form:form>

	<table align="center">
		<tr>
			<td style="font-style: italic; color: red;">${message}</td>
			<br>
			<td><a href="/Kinder-Animal-Food/systems/">Back</a></td>
		</tr>
	</table>
</body>
</html>

<script type="text/JavaScript">
	function createstyle(css) {
		var mystyle = $('#mystyle');
		if (!mystyle.length > 0) {
			var style = "<style id='mystyle'></style>";
			$(document).find('head').append(style);
			mystyle = $('#mystyle');
		}
		mystyle.append(css);
	}

	function autoShow(list, id, select_id) {
		var accreditation_name = document.getElementById("accreditation_name").value;
		if (accreditation_name != "") {
			ratingChange(list, accreditation_name, select_id);
		}

		id = id || "#value";
		var wd = $(id)[0].clientWidth;
		var hg = $(id)[0].clientHeight;
		var suggest = '<ul id="suggest" style="display: none;position:absolute;width: '+wd+'px; background-color: white;padding: 0px;margin:0px;"></ul>';
		var css_li = "#suggest li{display: block;height:"
				+ hg
				+ ";font: 14px/25px 'Arial','Arial',sans-serif;margin: 0px;color:rgb(0, 0, 0);text-align: left;padding:1px}";
		css_li += "#suggest li:hover{cursor: pointer;margin: 0px;background-color: rgb(227,227,227);}";
		$(id).after(suggest);
		createstyle(css_li);
		$(id).bind('keyup click', function(e) {
			var name = $(this).val();
			var num = 0;
			if (name != '') {
				var html = '';
				for (var i = 0; i < list.length; i++) {
					if (list[i].name.indexOf(name) > -1) {
						html += "<li>" + list[i].name + "</li>";
						num++;
					}
					if (num > 9) {
						num = 0;
						break;
					}
				}
				if (html != '') {
					$('#suggest').show();
					$('#suggest').html(html);
					$('#suggest li').css(css_li);
					$('#suggest li').bind('click', function(e) {
						var target = $(e.target).html();
						ratingChange(list, target, select_id);
						$(id).val(target);
						$('#suggest').hide();
					});
				}
			} else {

				$('#suggest').hide();
			}
		});

		$(id).blur(function() {
			setTimeout(function() {
				$('#suggest').hide();
			}, 150);
		})

	}

	function ratingChange(list, target, select_id) {
		for (var i = 0; i < list.length; i++) {
			if (list[i].name == target) {
				$(select_id).val(list[i].rating);
			}
		}
	}

	function getAccreditations() {
		var accreditations = [];
		<c:forEach items="${requestScope.accreditations}" var="accreditation">
		accreditations.push({
			name : "${accreditation.getAccreditation_name()}",
			rating : "${accreditation.getRating()}"
		});
		</c:forEach>
		return accreditations;
	}

	function validateBrand() {
		var brand_name = document.getElementById('brand_name').value;
		var brand_category = document.getElementById('brand_category').value;
		var accreditation_name = document.getElementById('accreditation_name').value;

		var brandNameNull = document.getElementById('brandNameNull');
		var brandCategoryNull = document.getElementById('brandCategoryNull');
		var accreditationNameNull = document
				.getElementById('accreditationNameNull');

		var validate = true;
		if (brand_name == "") {
			brandNameNull.style.display = "";
			validate = false;
		} else {
			brandNameNull.style.display = "none";
		}
		if (brand_category == "") {
			brandCategoryNull.style.display = "";
			validate = false;
		} else {
			brandCategoryNull.style.display = "none";
		}
		if (accreditation_name == "") {
			accreditationNameNull.style.display = "";
			validate = false;
		} else {
			accreditationNameNull.style.display = "none";
		}
		return validate;
	}

	function submitBrand() {
		if (validateBrand()) {
			alert(document.getElementById("image").value);
			var brandInsertForm = document.getElementById("brandInsertForm");
			brandInsertForm.submit();
		}
	}
	
	function imageConvert(){
		var inputBox = document.getElementById("imageSelect");
		inputBox.addEventListener("change", function() {
			//alert(document.getElementById("imageSelect").value);
			var reader = new FileReader();
			reader.readAsDataURL(inputBox.files[0]);
			// Initiate an asynchronous request
			reader.onload = function() {
				// After the reading is completed, the data is saved in the result attribute of the object.
				console.log(this.result)
				document.getElementById("img").src = this.result;
				document.getElementById("image").value = this.result;
			}
		})
	}
	var accreditations = getAccreditations();
	autoShow(accreditations, '#accreditation_name', '#rating');
	imageConvert();
	
</script>