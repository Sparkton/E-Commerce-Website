var value = 0;
//function displayUpdate(tr){
//console.log("update : "+tr);
//var c = document.getElementById(tr).children;
//document.getElementById('serialIn').value = c[0].innerText;
//document.getElementById('catIn').value = c[1].innerText;
//document.getElementById('pdtIn').value = c[2].innerText;
//document.getElementById('costIn').value = c[3].innerText;
//document.getElementById('Demo').innerHTML = "ProductUpdated <br>";
//del(tr);

//}
//function add(){
//var table = document.getElementById('myTable'); 
//var tbody = document.getElementById('tbody');
//console.log("add : "+value);
//if(document.getElementById('serialIn').value=='')
//++value;
//var x = document.getElementById("catIn").value;
//var y = document.getElementById("pdtIn").value;
//if(x != '' || y!= ''){

//var tr = document.createElement('tr'); 

//var td = document.createElement('td'); 
//if(document.getElementById('serialIn').value!= ''){
//tr.setAttribute("id", document.getElementById("serialIn").value);
//td.innerHTML = document.getElementById("serialIn").value;
//}
//else{
//tr.setAttribute("id", value);
//td.innerHTML = value;
//}

//var td1 = document.createElement('td'); 
//td1.innerHTML = x;

//var td2 = document.createElement('td'); 
//td2.innerHTML = y;

//var td3 = document.createElement('td'); 
//td3.innerHTML = document.getElementById("costIn").value;

//var btnAdd = document.createElement("BUTTON");
//btnAdd.classList.add("ak");
//btnAdd.innerHTML = "UPDATE";

//var btnRem = document.createElement("BUTTON");
//btnRem.classList.add("ak");
//btnRem.innerHTML = "REMOVE";

//tr.appendChild(td); 
//tr.appendChild(td1); 
//tr.appendChild(td2); 
//tr.appendChild(td3); 
//tr.appendChild(btnAdd);
//tr.appendChild(btnRem);
//tbody.appendChild(tr);
//table.appendChild(tbody);
//btnAdd.addEventListener("click", function(){displayUpdate(tr.id)});
//btnRem.addEventListener("click", function(){del(tr.id)});

//document.getElementById('Demo').setAttribute("class","visible");
//document.getElementById('Demo').innerHTML = "Product ADDED And Updated"

//document.getElementById("pdtIn").value = "";
//document.getElementById("catIn").value = "";
//document.getElementById("serialIn").value = "";
//document.getElementById("costIn").value = "";

//}
//else
//alert("Enter Product Name and Category");
///*}
//else
//alert("Duplicate ID");*/
//}
//function del(x){
//console.log('del: '+x);
//document.getElementById(x).remove();
//if(document.getElementById('serialIn').value=='')
//--value;
//document.getElementById('Demo').innerHTML = "Product Deleted"
//}

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

	document.body.style.background = bgColor; //body.style.
}

function openForm() {
	document.getElementById("myForm").style.display = "block";
}

function closeForm() {
	document.getElementById("myForm").style.display = "none";
}
function uUpdate(x){
	
}
/*$(document).ready(function() {
	$('#deleteButton').click(function(x) {
		$.ajax({
			type: "post",
			url: "/UserDel",
			data: "serialIn="+ $(x)
		});
	});
});*/
var id = 0;
function uDelete(x) {
	id = x;
	console.log("Call success");
		$.ajax({
			method : "POST",
			url : "/UserDel",
			data : {
				ID : id
			}
	});
}

/*<!-- <script src="script/demo_script_src.js"></script>-->
<!--<link rel="stylesheet" type="text/css" href="css/styles.css">--> 
<!-- <script src="bootstrap/jquery.min.js" ></script> -->
<!-- <script src="bootstrap/popper.min.js"></script> -->
<!-- <link rel="stylesheet" href="bootstrap/bootstrapmin.css"> -->
<!-- <script src="bootstrap/bootstrap.min.js"></script> -->*/