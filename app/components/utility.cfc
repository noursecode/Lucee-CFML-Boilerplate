component{

	this.dsn = "dsn_app";
	
	
	function ellipsis(input,count) {
		if( len(input) > count ){
			return left(input,count) & '..';
		} else {
			return input;
		};
	};


	function badrequest() {
		returnDoc = { "400":"Bad Request" };
		header statuscode=400 statustext='Bad Request';
		content type="application/json";
		res = serializejson(returnDoc);
		return writeoutput(res);
	};


	function clienttime( timezone ) {
		tz = getTimeZoneInfo(timezone);
		seconds = tz.offset;
	    res = DateAdd('s', seconds, now());
		return res;
	};
	


	function createID(prefix){
		i = 0;
		chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		res = "";
        for (i = 0; i < 20; i++) {
            res &= Mid(chars, RandRange(1, len(chars)), 1);
        }
        res = prefix & '_' & res;
		return res;
	};
	


	function createCode(){
		i = 0;
		chars = "0123456789";
		res = "";
        for (i = 0; i < 6; i++) {
            res &= Mid(chars, RandRange(1, len(chars)), 1);
        }
		return res;
	};
	

	function json(returnDoc) {
		header statuscode=200 statustext='OK';
		content type="application/json";
		res = serializejson(returnDoc);
		return writeoutput(res);
	};

	function html(markup) {
		header statuscode=200 statustext='OK';
		content type="text/html";
		return writeoutput(markup);
	};



	function from_fullname(fullname){
		n = []; data = {};
		for( i=1; i <= listlen(fullname," "); i++ ){
			n[i] = listgetat(fullname,i," ");
		};
		if(len(fullname) eq 0){
			data.fname ="";
			data.mname ="";
			data.lname ="";
		};
		switch(len(n)){
			case 1: data.fname = n[1]; data.mname = ""; data.lname = ""; break;
			case 2: data.fname = n[1]; data.mname = ""; data.lname = n[2]; break;
			case 3: data.fname = n[1]; data.mname = n[2]; data.lname = n[3]; break;
			case 4: data.fname = n[1]; data.mname = n[2]; data.lname = n[3] & " " & n[4]; break;
		};
		return data;
	};



	function createticket(){
		i = 0;
		chars = "0123456789";
		res = "";
        for (i = 0; i < 6; i++) {
            res &= Mid(chars, RandRange(1, len(chars)), 1);
        };
		return res;
	};


	function phone_clean(phone) {
		phone = replacenocase(phone,"<","","all");
		phone = replacenocase(phone,">","","all");
		phone = replacenocase(phone,"-","","all");
		phone = replacenocase(phone,"(","","all");
		phone = replacenocase(phone,")","","all");
		phone = replacenocase(phone," ","","all");
		if( len(phone) == 11 and left(phone,1)=="1"){ phone = right(phone,10); };
		if( len(phone) > 10 ){ phone = left(phone,10); };
		if( len(phone) < 10 ){ phone= ""};
		return phone;
	};



	function to_days(date){
		y1 = createdate( '0100','01','01' );
		days = datediff('d',y1,date) + 36525;
		return days;
	};


	function from_days(days){
		days = days - 36523;
		y1 = createdate( '0100','01','01' );
		date = dateformat(dateadd('d',days,y1),'yyyy-mm-dd');
		return date;
	};


	function to_unix(datetime){
		unixtime = datediff('s',createdatetime('1970','01','01','00','00','00'),datetime);
		return unixtime;
	};


	function ordinal(input){
		switch(input){
			case 1: n = '1st'; break;
			case 2: n = '2nd'; break;
			case 3: n = '3rd'; break;
			case 21: n = '21st'; break;
			case 22: n = '22nd'; break;
			case 23: n = '23rd'; break;
			case 31: n = '31st'; break;
			case 32: n = '32nd'; break;
			case 33: n = '33rd'; break;
			default: n = input & 'th'; break;
		};
		return n;
	};



}