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
		window.addEventListener(‘keydown’, function(e) {
			keys[e.keyCode] = true;
			e.preventDefault();
		});
		window.addEventListener(‘keyup’, function(e) {
			delete keys[e.keyCode];
		});

		function Box(options) {
			this.x = options.x || 10;
			this.y = options.y || 10;
			this.width = options.width || 40;
			this.height = options.height || 50;
			this.color = options.color || ‘#000000’;
			this.speed = options.speed || 5;
			this.direction =options.direction || ‘right’;
			this.collideWith = function(otherobject) {
				var myleft = this.x;
				var myright = this.x + (this.width);
				var mytop = this.y;
				var mybottom = this.y + (this.height);
				var collision = true
				if ((mybottom <= othertop) || (mytop >= otherbottom) || (myright <= otherleft) || (myleft >= otherright)) {
					collision = false;
				}
			} 
		}
		var player = new Box({
			x: 10, 
			y: 10,
			width: 50,
			height: 40,	
			color: "#44ee11",
			speed: 5
		});
		var food = new Box({
			x: 100, 
			y: 100,
			width: 25,
			height: 25,	
			color: "#ee3344"
		});
		function input(player) {
			if(37 in keys) {
				player.x -= player.speed;
				player.direction = "left";
			}
			if(39 in keys) {
				player.x += player.speed;
				player.direction = "right";
			}
			if(38 in keys) {
				player.y -= player.speed;
				player.direction = "up";
			}
			if(40 in keys) {
				player.y += player.speed;
				player.direction = "down";
			}
		}

		function drawBox(box) {	
			ctx.fillStyle = box.color;
			ctx.fillRect(box.x, box.y, box.width, box.height);
		}
		function update() {
			input(player);
		}
		function draw() {
			if (player.collideWith(food)) {
				ctx.font = “24px Arial”;
				ctx.fillStyle = “rgb(255, 0 ,255)”;
				ctx.fillText(“COLLISION DETECTED”, 50, 50);
			} else { 
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				drawBox(player);
				drawBox(food);
			}
		}
		function loop() {
			update();
			draw();
			window.requestAnimationFrame(loop);
		}
		loop();
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
