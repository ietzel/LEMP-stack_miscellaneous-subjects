<html>
	<head runat="server">
		<title>Vampire: The Masquerade</title>
	</head>
	<body>
		<canvas id="gC" width="1000" height="800"></canvas>
		<script>
			var canvas = document.getElementById("gC");
			var ctx = canvas.getContext("2d");
			canvas.width = canvas.innerWidth;
			canvas.height = canvas.innerHeight;
	
			var keys = {};
			window.addEventListener("keydown", function(e) {
				keys[e.keyCode] = true;
				e.preventDefault();
			});
			window.addEventListener("keyup", function(e) {
				delete keys[e.keyCode];
			});
	
			function Box(options) {
				this.x = options.x || 10;
				this.y = options.y || 10;
				this.width = options.width || 40;
				this.height = options.height || 50;
				this.color = options.color || "#000000";
				this.speed = options.speed || 5;
				this.direction = options.direction || "right";
				this.collideWith = function(otherobject) {
					var myleft = this.x;
					var myright = this.x + (this.width);
					var mytop = this.y;
					var mybottom = this.y + (this.height);
					var otherleft = otherobject.x;
					var otherright = otherobject.x + (otherobject.width);
					var othertop = otherobject.y;
					var otherbottom = otherobject.y + (otherobject.height);
					var collision = true;
					if ((mybottom <= othertop) || (mytop >= otherbottom) || (myright <= otherleft) || (myleft >= otherright)) {
						collision = false;
					}
				} 
				//Physical: Athletics, Brawl, Craft, Drive, Firearms, Larceny, Melee, Stealth, Survival.
				this.strength = 1;
				this.dexterity = 1;
				this.stamina = 1;
				//Mental: Academics, Awareness, Finance, Investigation, Medicine, Occult, Politics, Science, Technology.
				this.intelligence = 1;
				this.wits = 1;
				this.resolve = 1;
				//Social: Animal Ken, Etiquette, Insight, Intimidation, Leadership, Performace, Persuasion, Streetwise, Subterfuge.
				this.charisma = 1;
				this.manipulation = 1;
				this.composure = 1;
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
					ctx.font = "24px Arial";
					ctx.fillStyle = "rgb(255, 0 ,255)";
					ctx.fillText("Collision Detected", 50, 50);
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
	</body>
</html>
