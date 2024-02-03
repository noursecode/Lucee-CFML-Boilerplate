<cfscript>
	
	success = false;
	msg = "";
	push = "";
	delay = "";

	try{
		try{ fullname = trim(form.fullname) } catch(any e){ fullname = "" };
		try{ email = trim(form.email) } catch(any e){ email = "" };
		try{ company = trim(form.company) } catch(any e){ company = "" };
		
		
		if( len(company) > 0 ){
			iscompany = true;
		} else {
			iscompany = false;
			msg = "Please enter company";
		}


		if( isvalid('email',email) ){
			isemail = true;
		} else {
			isemail = false;
			msg = "Please enter email";
		};


		fn = application.util.from_fullname(fullname);
		if( len(fn.fname) > 0 AND len(fn.lname) > 0 ){
			isname = true;
		} else {
			isname = false;
			msg = "Please enter full name";
		};

		if(iscompany and isemail and isname){
			success = true;
			msg = "Thank you!";
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