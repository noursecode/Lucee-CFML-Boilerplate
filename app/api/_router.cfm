<cfscript>
	endpoint = "/" & p2;
	
	if( req.method=='GET' ){
		switch(endpoint){
			case "/": 					application.util.badrequest(); break;
		}
	};


	if( req.method=='POST' ){
		
		switch(endpoint){
	
			case "/": 					application.util.badrequest(); break;
			
			case "/login": 				include template="/api/login.cfm"; view="vblank"; break;
			
			case "/signup": 			include template="/api/signup.cfm"; view="vblank"; break;
			
			case "/test": 				include template="/api/test.cfm"; view="vblank"; break;

			default: 					application.util.badrequest(); break;
		};


	};


</cfscript>