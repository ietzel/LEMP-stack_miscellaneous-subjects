                                <!--Physical: Athletics, Brawl, Craft, Drive, Firearms, Larceny, Melee, Stealth, Survival.
				this.strength = 1;
				this.dexterity = 1;
				this.stamina = 1;
				Mental: Academics, Awareness, Finance, Investigation, Medicine, Occult, Politics, Science, Technology.
				this.intelligence = 1;
				this.wits = 1;
				this.resolve = 1;
				Social: Animal Ken, Etiquette, Insight, Intimidation, Leadership, Performace, Persuasion, Streetwise, Subterfuge.
				this.charisma = 1;
				this.manipulation = 1;
				this.composure = 1;-->
<!-- directives -->
<% @Page Language="C#" %>

<!-- code section -->
<script runat="server">

   private void convertoupper(object sender, EventArgs e) {
      string str = mytext.Value;
      changed_text.InnerHtml = str.ToUpper();
   }
</script>

<!-- Layout -->
<html>
   <head> 
      <title> Change to Upper Case </title> 
   </head>
   <body>
      <h3> Conversion to Upper Case </h3>
      <form runat="server">
         <input runat="server" id="mytext" type="text" />
         <input runat="server" id="button1" type="submit" value="Enter..." OnServerClick="convertoupper"/>
         <hr/>
         <h3> Results: </h3>
         <span runat="server" id="changed_text" />
      </form>
   </body>
</html>
