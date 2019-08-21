buffer results;
string loader = '<div class="loadericon" style="display:none"><img src="/images/itemimages/karma.gif"></div>';

string get_whitelist() {
	string url = visit_url("clan_signup.php");
	int start = index_of(url, "<select name=whichclan>")+ length("<select name=whichclan>");
	int end = index_of(url, " <input", start);
	return substring(url, start, end);
}

buffer clanhoplinks()
{
	string wl = get_whitelist();
	string[string] ff = form_fields();
	string wldropdown = "<p><center><form id=whitelist action=clan_hall.php method=get><input type=hidden name=recruiter value=1>Whitelist List: <select name=goclan>" + wl + "<input type=submit class=button value='Go to Clan' onclick='return showloader();' >" + loader + "<p></center><center>";
	
	if(ff contains "goclan")
	{
		return visit_url("showclan.php?recruiter=1&whichclan=" + ff["goclan"] + "&pwd=" + my_hash() + "&whichclan=" + ff["goclan"] + "&action=joinclan&apply=Apply+to+this+Clan&confirm=on").replace_string("<head>", "<head><script type=\"text/javascript\" src=\"loader.js\"></script>").replace_string("<p><centeR>",wldropdown);
	}
	return results.replace_string("<p><centeR>",wldropdown);
}

void main()
{
	results = visit_url("clan_hall.php").replace_string("<head>", "<head><script type=\"text/javascript\" src=\"loader.js\"></script>");
	
	write(clanhoplinks());
}
