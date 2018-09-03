$(function(){
	
	$("#datePicker").datepicker({
		format: 'mm/dd/yyyy',
        todayHighlight: true,
        autoclose: true
	}); 
	
	$("#registerJs").on("click",function(e){
		e.preventDefault();
		$("#hide3").hide();
		$("#hide4").hide();
		$("#hide5").hide();
		$("#hideRole").hide();
		$("#hideEmp").hide();
		$("#hide2").show();
	});
	
	$("#limitJs").on("click",function(e){
		e.preventDefault();
		$("#hide2").hide();
		$("#hide4").hide();
		$("#hide5").hide();
		$("#hideRole").hide();
		$("#hideEmp").hide();
		$("#hide3").show();
	});
	
	$("#requestJs").on("click",function(e){
		e.preventDefault();
		$("#hide2").hide();
		$("#hide3").hide();
		$("#hide5").hide();
		$("#hideRole").hide();
		$("#hideEmp").hide();
		$("#hide4").show();
	});
	
	$("#archiveJs").on("click",function(e){
		e.preventDefault();
		$("#hide2").hide();
		$("#hide3").hide();
		$("#hide4").hide();
		$("#hideRole").hide();
		$("#hideEmp").hide();
		$("#hide5").show();
	});
	$("#roleJs").on("click",function(e){
		e.preventDefault();
		$("#hide2").hide();
		$("#hide3").hide();
		$("#hide4").hide();
		$("#hide5").hide();
		$("#hideEmp").hide();
		$("#hideRole").show();
	});
	
	$("#empView").on("click",function(e){
		e.preventDefault();
		$("#hide2").hide();
		$("#hide3").hide();
		$("#hide4").hide();
		$("#hide5").hide();
		$("#hideRole").hide();
		$("#hideEmp").show();
	});
	
	
	$("#empJs").on("click",function(e){
		e.preventDefault();
		$("#hide7").hide();
		$("#hide8").hide();
		$("#hide9").hide();
		$("#hide6").show();
	});
	
	$("#formJs").on("click",function(e){
		e.preventDefault();
		$("#hide6").hide();
		$("#hide8").hide();
		$("#hide9").hide();
		$("#hide7").show();
	});
	
	$("#updateJs").on("click",function(e){
		e.preventDefault();
		$("#hide6").hide();
		$("#hide7").hide();
		$("#hide9").hide();
		$("#hide8").show();
	});
	
	$("#commentJs").on("click",function(e){
		e.preventDefault();
		$("#hide6").hide();
		$("#hide7").hide();
		$("#hide8").hide();
		$("#hide9").show();
	});
	
	$(".toggle-btn").on("click",function(e){
		$("#side").classlist.toggle("active");
		
	});
	
	$("#submitEmp").on("click",function(e){
		e.preventDefault();	
		$("#param").empty();
		console.log("inside");
		$.post("/FileManagement/registerEmployee",$("#registerForm").serialize(),function(data){
			$("#registerForm")[0].reset();
			document.getElementById("param").innerHTML = data;
			console.log("am back");
		});
	});
	
	$("#deptData").on("click",function(e){
		e.preventDefault();
		$.post("/FileManagement/limitAccess",$("#limitForm").serialize(),function(data){
			$("#limitForm")[0].reset();
			document.getElementById("limitResponse").innerHTML=data;
		});
	});
	
	
	$("#archiveFind").on("click",function(e){
		e.preventDefault();
		$("#archiveDiv").hide();
		console.log("inside archive");
		$.post("/FileManagement/archiveSearch",$("#archiveForm").serialize(),function(data){
			console.log("back");
			$("#archiveForm")[0].reset();
			document.getElementById("archiveResponse").value=data.payroll;
			document.getElementById("archiveResponse1").innerHTML="<strong>PAYROLL : </strong>"+data.payroll;
			document.getElementById("archiveResponse2").innerHTML="<strong>NAME : </strong>"+data.firstName+" "+data.lastName;
			document.getElementById("archiveResponse3").innerHTML="<strong>DEPARTMENT : </strong>"+data.department;
			$("#archiveDiv").show();
		});
	})
	
	$("#archiveBtn").on("click",function(e){
		e.preventDefault();
		var text = document.getElementById("archiveResponse").value;
	
		$.post("/FileManagement/archiveEmployee",$("#archivePayrollForm").serialize(),function(data){
			$("#archiveDiv").hide();
			document.getElementById("archiveRespo").innerHTML=data;
		});  
	});  
	
	
	$("#formButton").on("click",function(e){
		e.preventDefault();
		console.log("inside");
		$.post("/FileManagement/fillForm",$("#empForm").serialize(),function(data){
			$("#empForm")[0].reset();
			console.log(data);
			document.getElementById("fillFormResponse").innerHTML=data;
		});
	});
	$("#updateButton").on("click",function(e){
		e.preventDefault();
		$.post("/FileManagement/updateForm",$("#updateForm").serialize(),function(data){
			$("#updateForm")[0].reset();
			document.getElementById("updateFormResponse").innerHTML=data;
		});
	});
	$("#roleButton").on("click",function(e){
		e.preventDefault();
		$.post("/FileManagement/changeRole",$("#roleForm").serialize(),function(data){
			$("#roleForm")[0].reset();
			document.getElementById("roleFormResponse").innerHTML=data;
		});
	});
	$("#adminButton").on("click",function(e){
		e.preventDefault();
		$.post("/FileManagement/changeRole",$("#adminForm").serialize(),function(data){
			$("#adminForm")[0].reset();
			document.getElementById("adminFormResponse").innerHTML=data;
		});
	});
	$("#logout").on("click", function(e) {
			e.preventDefault();
			$("#logout-form").submit();
		});
	$("#deptButton").on("click",function(e){
		e.preventDefault();
		$.post("/FileManagement/getEmployee",$("#deptForm").serialize(),function(data){
			$("#deptForm")[0].reset();
			document.getElementById("payrolltd").innerHTML=data.payroll;
			document.getElementById("nametd").innerHTML=data.firstName+" "+data.lastName;
			document.getElementById("departmenttd").innerHTML=data.department;
			document.getElementById("phoneNumbertd").innerHTML=data.phoneNumber;
			document.getElementById("emailtd").innerHTML=data.email;
			document.getElementById("statustd").innerHTML=data.status;
			document.getElementById("dobtd").innerHTML=data.dob;
			document.getElementById("addresstd").innerHTML=data.address;
			$("#tBody").show();
		});
	});
	
	$(document).on(
			'change',
			'.btn-file :file',
			function() {
				var input = $(this), label = input.val()
						.replace(/\\/g, '/')
						.replace(/.*\//, '');
				input.trigger('fileselect', [ label ]);
			});
	$('.btn-file :file').on(
			'fileselect',
			function(event, label) {

				var input = $(this).parents('.input-group')
						.find(':text'), log = label;

				if (input.length) {
					input.val(log);
				} else {
					if (log)
						alert(log);
				}

			});
	
	$("#uploadBtn").on("click",function(e){
		e.preventDefault();
		var formData = new FormData($("#uploadForm")[0]);
		/*$.post("/FileManagement/addImage",formData,function(data){
			$("#uploadForm")[0].reset();
			$("#imageResponse").attr({
				"src" : "data:image/jpg;base64,"+data
			});
		});*/
		$.ajax({
            type: 'POST',
            url: "/FileManagement/addImage",
            dataType: 'text',
            data:formData,
            cache:false,
            contentType: false,
            processData: false,
            success: function(data) {
            	$("#uploadForm")[0].reset();
    			$("#imageResponse").attr({
    				"src" : "data:image/jpg;base64,"+data
    			});
            }
        });
	});
	
	$("#passwordButton").on("click",function(e){
		e.preventDefault();
		$.post("/FileManagement/changePassword",$("#passwordForm").serialize(),function(data){
			$("#passwordForm")[0].reset();
			document.getElementById("passwordFormResponse").innerHTML = data;
		});
	});
	
	$("#notificationButton").on("click",function(e){
		e.preventDefault();
		$.post("/FileManagement/sendEmail",$("#notificationForm").serialize(),function(data){
			$("#notificationForm")[0].reset();
			document.getElementById("notificationResponse").innerHTML=data;
		});
	});
});

