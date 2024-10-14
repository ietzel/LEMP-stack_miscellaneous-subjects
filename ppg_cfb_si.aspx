<!DOCTYPE html>
<html>
	<head runat="server">
		<title>Vampire: The Masquerade</title>
	</head>
	<body>
		<canvas id="gC" width="650" height="600"></canvas>
		<script>
			var canvas = document.getElementById("gC");
			var ctx = canvas.getContext("2d");
			canvas.width = canvas.innerWidth;
			canvas.height = canvas.innerHeight;
	
			var score1 = 0;
			var score2 = 0;
			var keys = {};
			window.addEventListener('keydown', function (e) {
				keys[e.keyCode] = true;
				e.preventDefault();
			});
			window.addEventListener('keyup', function (e) {
			delete keys[e.keyCode];
			});
			function Box(options) {
				this.x = options.x || 10;
				this.y = options.y || 10;
				this.width = options.width || 40;
				this.height = options.height || 50;
				this.color = options.color || '#FFFFFF';
				this.speed = options.speed || 2;
				this.gravity = options.gravity || 2;
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
			var player1 = new Box({
				x: 10,
				y: 200,
				width: 15,
				height: 80,
				color: "black",
				gravity: 2
			});
			var player2 = new Box({
				x: 625,
				y: 100,
				width: 15,
				height: 80,
				color: "black",
				gravity: 2
			});
			var midLine = new Box({
				x: (canvas.width/2) - 2.5,
				y: -1,
				width: 5,
				height: canvas.height+1,
				color: "black"
			});
			var theBall = new Box({
				x: (canvas.width / 2),
				y: (canvas.height / 2),
				width: 15,
				height: 15,
				color: "black",
				speed: 1,
				gravity: 1
			});
			function input() {
				if (87 in keys) {
					if ((player1.y - player1.gravity) > 0) {
						player1.y -= player1.gravity;
					}
				} else if (83 in keys) {
					if ((player1.y + player1.height + player1.gravity) < canvas.height) {
						player1.y += player1.gravity;
					}
				} 
				if (38 in keys) {
					if ((player2.y - player2.gravity) > 0) {
						player2.y -= player2.gravity;
					}
				} else if (40 in keys) {
					if ((player2.y + player2.height + player2.gravity) > canvas.height) {
						player2.y += player2.gravity;
					}
				}
			}
			function drawBox(box) {
				ctx.fillStyle = box.color;
				ctx.fillRect(box.x, box.y, box.width, box.height);
			}
			function ballBounce() {
				if (((theBall.y+theBall.gravity) <= 0) || ((theBall.y+theBall.gravity+theBall.height) >= canvas.height)){
					theBall.gravity = theBall.gravity * -1;
					theBall.y += theBall.gravity;
					theBall.x += theBall.speed;
				} else {
					theBall.x += theBall.speed;
					theBall.y += theBall.gravity;
				}
					ballCollision();
				}
				function ballCollision() {
					if (((theBall.x + theBall.speed) <= 0) || ((theBall.x + theBall.speed + theBall.width) >= canvas.width)) {
					theBall.speed = theBall.speed * -1;
					theBall.x += theBall.speed;
					theBall.y += theBall.gravity;
				} else {
					theBall.x += theBall.speed;
					theBall.y += theBall.gravity;
				}
				draw();
			}
			function draw() {
				ctx.fillStyle="grey";
				ctx.clearRect(0, 0, canvas.width, canvas.height);
				drawBox(player1);
				drawBox(player2);
				drawBox(midLine);
				drawBox(theBall);
			}
			function loop() {
				ballBounce();
				input(player1);
				input(player2);
				window.requestAnimationFrame(loop);
			}
			loop();
		</script>
	</body>
</html>
