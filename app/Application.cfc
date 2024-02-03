component output="false"{
	this.name = "cfapp";
	this.applicationTimeout = createTimeSpan(0,0,30,0);
	this.sessionmanagement = true;
	this.setclientcookies = true;
	
	this.mappings["/api"]="./api";
	this.mappings["/drawer"]="./drawer";
	this.mappings["/include"]="./include";
	this.mappings["/components"]="./components";
	this.mappings["/controllers"]="./controllers";

	setting enablecfoutputonly=true;
	setting requesttimeout=300;


	public boolean function onApplicationStart(){
		application.util = new components.utility();
		return true;
	}

	public boolean function onRequestStart(){
		param name="view" default="vblank";
		param name="url.p1" default="";
		param name="url.p2" default="";
		param name="url.p3" default="";
		param name="url.p4" default="";
		param name="url.p5" default="";
		param name="url.p6" default="";
		param name="url.p7" default="";
		param name="url.p8" default="";
		param name="p1" default=url.p1;
		param name="p2" default=url.p2;
		param name="p3" default=url.p3;
		param name="p4" default=url.p4;
		param name="p5" default=url.p5;
		param name="p6" default=url.p6;
		param name="p7" default=url.p7;
		param name="p8" default=url.p8;
		param name="metatitle" default="Dev";
		param name="utoken" default="";
		param name="isauth" default=false;
		
		req = getHTTPRequestData();
		
		if(req.headers.host == 'localhost:3090'){
			param name="root" default = "http://localhost:3090";
		} else {
			param name="root" default = "https://cfapp.noursecode.com";
		};
		
		
		if(p1 == 'reinit'){ onApplicationStart(); dump(application) };

		
		try { utoken = cookie.utoken } catch (any e) {};
		
		endpoint = "/" & p1;

		return true;
	}


	public void function onRequest(required string thepage){
		savecontent variable='body'{
			include template=arguments.thepage;
		};
	}

	public void function onRequestEnd(){
		include template="./views/" & view & ".cfm";
	}
	

	
}