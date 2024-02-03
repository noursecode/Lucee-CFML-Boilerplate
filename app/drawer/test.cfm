<cfscript>
</cfscript>

<cfoutput>
<div class="drawer_header">
	<div class="drawer_hdleft">
	</div>
	<div class="drawer_title">Drawer</div>
	<div class="drawer_hdright">
	<button class="drawer_close" data-drawer="close"></button>
	</div>
</div>

<div class="drawer_main">

	<form class="form_onecol" id="formid" method="POST" action="/api/test">
	
	<div>This demonstrates a slide-out component. Javascript and CSS is used to open/close, but everything else is Lucee and HTML.</div>
	<div class="form_space10"></div>
	<div>This kind of component can be used for form input while updating the main view at the same time. In other words, it shows the user their changes.</div>
	
	<div class="form_space10"></div>
	
	<div class="form_space30"></div>
	<div class="form_footer_text"><a href="##" class="cancelbtn" id="cancelbtn" data-drawer="close">CANCEL</a></div>
	<div class="form_space10"></div>
	
	</form>

</div>
</cfoutput>
