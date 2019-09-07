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
	return results.replace_string("<p><centeR>","<p><centeR>I can't continue to support this game, given the reports of Zack Johnson's abuse. Due to the lack of response from the development team, this script has been modified in an attempt to spread information any way I can.<br><br>");
}

void main()
{
	results = visit_url("clan_hall.php").replace_string("<head>", "<head><script type=\"text/javascript\" src=\"loader.js\"></script>");
	
	write(clanhoplinks());
}
