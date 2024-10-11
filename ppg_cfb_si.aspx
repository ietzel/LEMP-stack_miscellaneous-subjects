<html xmlns="www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<canvas id="gC" width="1000" height="800"></canvas>
	<script>
		var canvas = document.getElementById("gC");
		var ctx = canvas.getContext("2d");
		canvas.width = canvas.innerWidth;
		canvas.height = canvas.innerHeight;

		var keys = {};
		window.addEventListener(‘keydown’, function(e){
			keys[e.keyCode] = true;
			e.preventDefault();
		});
		window.addEventListener(‘keyup’, function(e){
			delete keys[e.keyCode];
		});
	</script>
	<%--
	<form id="form1" runat="server">
	<div>
	<%Response.Write("Vampire: the Masquerade");%
	</div>
	</form>
	--%>
</body>
</html>
