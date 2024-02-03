<cfscript>
metatitle="Login";
</cfscript>

<cfoutput>
<cfinclude template="/include/header-login.cfm">
<style>
	
section{
	margin:0 auto;
	max-width: 360px;
	}
	
</style>
<main>

<section>
	<form id="formid" method="POST" action="/api/login">
		
	<div>This boilerplate app uses the latest stable version of Lucee and is deployed as a docker container. Minimimal javascript navigates pages without refresh, and submits forms. No database here.</div>
	<div class="form_space20"></div>
	
	<div>I got the hint someone wanted to see code, so I pushed this to a public Github repo.</div>
	<div class="form_space20"></div>
		
	<div>Below is a demonstration of a login form without a password. Click the button to see what happens. It won't log you in.</div>
	
	<div class="form_space30"></div>
		
	<div class="title">
		<div class="title_lt">
			<h1>Log In</h1>
		</div>
		<div class="title_rt">
		</div>
	</div>
	<div class="form_space20"></div>
	
	<input type="text" class="form_input" id="email" name="email" placeholder="Email">
	<div class="form_space10"></div>

	<button type="submit" class="form_btn" id="formbtn">Continue</button>
	
	<div class="form_space30"></div>
	<div class="form_footer_text">Dont't have an account? <a href="#root#/signup">Please sign up</a></div>
	

	
	

	</form>
</section>


</main>
<cfinclude template="/include/footer-login.cfm">
</cfoutput>