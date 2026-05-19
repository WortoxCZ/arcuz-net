stop();
gamename = "arcuz";
domain_parts = _url.split("://");
real_domain = domain_parts[1].split("/");
hostingdomain = real_domain[0];
if(hostingdomain == "")
{
   hostingdomain = "unknown";
}
savedomain1 = "gamedev.dev.spilgames.com";
savedomain2 = "www8.agame.com";
if(hostingdomain == savedomain1 || hostingdomain == savedomain2)
{
   spilnetwerk = "internal";
}
else
{
   spilnetwerk = "external";
}
_root.localization_url1 = " http://www.a10.com/?utm_medium=brandedgames_" + spilnetwerk + "&utm_campaign=" + gamename + "&utm_source=" + hostingdomain;
_root.localization_language_nr = 1;
_root.localization_branding_nr = 46;
_root.localization_portal = "teen";
