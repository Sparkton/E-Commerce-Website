function validateForm(){
	var name = $('#name');
	var uName = $('#uName').val();
	var pass = $('#pass');
	var phoneNo = $('#pNo');
	var email = $('#emailId');
	
	if(name.val() == "")
	{ 
        window.alert("Please enter your name."); 
        //name.focus();
    }
	if (email.val() == "" || email.val().indexOf("@", 0) < 0 || email.val().indexOf(".", 0) < 0)                                   
    { 
        window.alert("Please enter a valid e-mail address."); 
       // email.focus(); 
    } 
    if (phoneNo.val() == "")                           
    { 
        window.alert("Please enter your telephone number."); 
       // phone.focus(); 
    }   
    if (pass.val() == "")                        
    { 
        window.alert("Please enter your password"); 
       // pass.focus(); 
    }
	if(/^[a-zA-Z0-9- ]*$/.test(uName) == false){
		window.alert("Please enter corrdct User Name"); 
       // uName.focus(); 
	}
}

$(document).ready(function()
{
  $("input").focus(function(){
    $(this).css("background-color", "#cccccc");
  });
  $("input").blur(function(){
    $(this).css("background-color", "#ffffff");
  });
})
function random_bg_color() {
    var x = Math.floor(Math.random() * 256);
    var y = Math.floor(Math.random() * 256);
    var z = Math.floor(Math.random() * 256);
    var bgColor = "rgb(" + x + "," + y + "," + z + ")";
	console.log(bgColor);
    document.body.style.background = bgColor;
    }