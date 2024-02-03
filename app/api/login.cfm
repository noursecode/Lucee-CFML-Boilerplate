<cfscript>
	
	success = false;
	msg = "";
	push = "";
	delay = "";

	try{
		try{ email = trim(form.email) } catch(any e){ email = "" };
		
		if( isvalid('email',email) ){
			isemail = true;
		} else {
			isemail = false;
			msg = "Please enter email";
		};
		
		
		if(isemail){
			success = true;
			msg = "Please check your inbox";
		};


		returnDoc = {
			'success' = success,
			'msg' = msg,
			'push' = push
		};
		
		application.util.json(returnDoc);
		
	} catch( any e ){
		dump(e);
	};

	
</cfscript>