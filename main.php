
'/*Physical: Athletics, Brawl, Craft, Drive, Firearms, Larceny, Melee, Stealth, Survival.';
'Mental: Academics, Awareness, Finance, Investigation, Medicine, Occult, Politics, Science, Technology.';
'Social: Animal Ken, Etiquette, Insight, Intimidation, Leadership, Performace, Persuasion, Streetwise, Subterfuge.*/';


$conn = new mysqli($servername, $username, $password);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

?>
