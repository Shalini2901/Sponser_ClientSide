$(document).ready(function()
{
if ($("#alertSuccess").text().trim() == "")
{
$("#alertSuccess").hide();
}
$("#alertError").hide();
});


//SAVE ======================================================
$(document).on("click", "#btnSave", function(event)
		{
		// Clear alerts---------------------
		//$("#alertSuccess").text("");
		//$("#alertSuccess").hide();
		//$("#alertError").text("");
		//$("#alertError").hide();
		// Form validation-------------------
		//var status = validateSponserForm();
		//if (status != true)
		//{
		//$("#alertError").text(status);
		//$("#alertError").show();
		//return;
		//}
		// If valid------------------------
		var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";
		$.ajax(
		{
		url : "SponsersAPI",
		type : type,
		data : $("#formSponser").serialize(),
		dataType : "text",
		complete : function(response, status)
		{
		onSponserSaveComplete(response.responseText, status);
		}
		});
		});
		
		
		// UPDATE==========================================
	$(document).on("click", ".btnUpdate", function(event){
	$("#hidItemIDSave").val($(this).data("itemid"));
	$("#sponserID").val($(this).closest("tr").find('td:eq(0)').text());
	$("#productId").val($(this).closest("tr").find('td:eq(1)').text());
	$("#firstName").val($(this).closest("tr").find('td:eq(2)').text());
	$("#lastName").val($(this).closest("tr").find('td:eq(3)').text());
	$("#sAmount").val($(this).closest("tr").find('td:eq(4)').text());
	$("#compName").val($(this).closest("tr").find('td:eq(5)').text());
	});
	
	
	// DELETE==========================================
	$(document).on("click", ".btnRemove", function(event)
	{
	$.ajax(
	{
	url : "SponsersAPI",
	type : "DELETE",
	data : "id=" + $(this).data("itemid"),
	dataType : "text",
	complete : function(response, status)
	{
	onSponserDeleteComplete(response.responseText, status);
	}
	});
	});
	
	
	
	// CLIENT-MODEL================================================================
function validateSponserForm()
{
// SPONSER_ID
if ($("#sponserID").val().trim() == "")
{
return "Insert Sponser ID.";
}
// PRODUCT_ID
if ($("#productId").val().trim() == "")
{
return "Insert Product ID.";
}

// FIRSTNAME
if ($("#firstName").val().trim() == "")
{
return "Insert First Name.";
}


// LASTNAME
if ($("#lastName").val().trim() == "")
{
return "Insert Last Name.";
}

// AMOUNT-------------------------------
if ($("#sAmount").val().trim() == "")
{
return "Insert Amount.";
}
// is numerical value
var tmpAmount = $("#sAmount").val().trim();
if (!$.isNumeric(tmpAmount))
{
return "Insert a numerical value for Amount.";
}
// convert to decimal price
$("#sAmount").val(parseFloat(tmpAmount).toFixed(2));


// COMPANY_NAME------------------------
if ($("#compName").val().trim() == "")
{
return "Insert Company Name.";
}
return true;
}


function onSponserSaveComplete(response, status)
{
if (status == "success")
{
var resultSet = JSON.parse(response);
if (resultSet.status.trim() == "success")
{
$("#alertSuccess").text("Successfully saved.");
$("#alertSuccess").show();
$("#divSponsersGrid").html(resultSet.data);
} else if (resultSet.status.trim() == "error")
{
$("#alertError").text(resultSet.data);
$("#alertError").show();
}
} else if (status == "error")
{
$("#alertError").text("Error while saving.");
$("#alertError").show();
} else
{
$("#alertError").text("Unknown error while saving..");
$("#alertError").show();
}

$("#hidItemIDSave").val("");
$("#formSponser")[0].reset();
}



function onSponserDeleteComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
		{
		$("#alertSuccess").text("Successfully deleted.");
		$("#alertSuccess").show();
		$("#divSponsersGrid").html(resultSet.data);
	} else if (resultSet.status.trim() == "error")
	{
		$("#alertError").text(resultSet.data);
		$("#alertError").show();
	}
	} else if (status == "error")
	{
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else
	{
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
	
}