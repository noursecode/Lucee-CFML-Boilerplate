<cfscript>
	param name="metatitle" default="";
	param name="login" default="";
	param name="signup" default="";
	param name="terms" default="";
	param name="privacy" default="";

	switch(endpoint){
		case "/":				include template="/controllers/login.cfm"; view="vmain"; break;
		
		case "/api":			include template="/api/_router.cfm"; view="vblank"; break;
		
		case "/drawer":			include template="/drawer/_router.cfm"; view="vblank"; break;
		
		case "/signup":			include template="/controllers/signup.cfm"; view="vmain"; break;
		
		case "/terms":			include template="/controllers/terms.cfm"; view="vmain"; break;
		
		case "/privacy":		include template="/controllers/privacy.cfm"; view="vmain"; break;
		
		default:				include template="/controllers/home.cfm"; view="vmain"; break;
	};
</cfscript>