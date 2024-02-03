<cfscript>
	endpoint = "/" & p2;

		
	switch(endpoint){

		case "/": 					application.util.badrequest(); break;
		
		case "/test": 				include template="/drawer/test.cfm"; view="vblank"; break;

		default: 					application.util.badrequest(); break;
	};


</cfscript>