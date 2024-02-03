<cfscript>
metatitle="Signup";
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
	<form id="formid" method="POST" action="/api/signup">
		
	<div>Demonstration of a signup form. Try it out to see how it works. All fields are validated, but won't actually sign you up.</div>
	<div class="form_space10"></div>
	<div>A real version of this would log you in and send a welcome email.</div>
	
	<div class="form_space30"></div>
		
	<div class="title">
		<div class="title_lt">
			<h1>Sign Up</h1>
		</div>
		<div class="title_rt">
		</div>
	</div>
	<div class="form_space20"></div>
	
	<label for="fullname">Your name</label>
	<input type="text" class="form_input" id="fullname" name="fullname">
	<div class="form_space10"></div>
	
	<label for="email">Your email</label>
	<input type="text" class="form_input" id="email" name="email">
	<div class="form_space10"></div>
	
	<label for="company">Your company</label>
	<input type="text" class="form_input" id="company" name="company">
	<div class="form_space20"></div>

	<button class="form_btn" id="formbtn">Continue</button>
	
	<div class="form_space30"></div>
	<div class="form_footer_text"><a href="/">Back to login</a></div>

	</form>
</section>


</main>
<cfinclude template="/include/footer-login.cfm">
</cfoutput>

