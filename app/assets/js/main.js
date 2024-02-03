"use strict";
let app={}, nd={};

window.onload = function(){
	nd.bd = document.getElementById('bd');
	nd.drawer = document.getElementById('drawer');
	nd.drawerbody = document.getElementById('drawerbody');
	nd.overflow = document.documentElement.style.overflow;
};



window.addEventListener("submit", function(event){
	event.preventDefault();
	let formData = new FormData(event.target);
	let action = event.target.action;
	let method = event.target.method;
	app.form.send(action,method,formData);
});


app.form =(function() {
	var send;
	send = async function(action,method,formData){
		
		let btn = document.getElementById('formbtn');
		let btntext = btn.textContent;
		btn.innerHTML = `<i class="btnspinner"></i>`;
		
		let response = await fetch(action,{
			method:method,
			body:formData,
			headers:{}
		});
		let res = await response.json();



		if( res.success ){
			btn.textContent = res.msg;
			btn.className = "form_btn_green";
			btn.disabled = true;
	
			setTimeout(function(){
				btn.disabled = false;
				btn.textContent = btntext;
				btn.className = "form_btn";
			}, 2000);
			
		} else {
			
			btn.textContent = res.msg;
			btn.className = "form_btn_orange";
			btn.disabled = true;
			setTimeout(function(){
				btn.disabled = false;
				btn.textContent = btntext;
				btn.className = "form_btn";
			}, 3000);
			
		};

	};

	return {
		send:send
	};
})();






window.addEventListener("click", function(event){

	if( Object.keys(event.target.dataset).length > 0  ){
		event.preventDefault();

		if( event.target.dataset.drawer ){
			let action = event.target.dataset.drawer;
			if( action == 'open'){
				app.drawer.open(event.target.href);
			} else {
				app.drawer.close();
			};
		};

	} else if( event.target.href ) {
		event.preventDefault();
		
		app.turbo.init(event.target.href);

	} else {
		//
	};

});





window.onpopstate = function(event) {
	if(event.state!=undefined){
		app.turbo.pop(event.state);
	} else {
		app.turbo.pop('/');
	};
};


app.turbo =(function() {
	var init, pop, get, ntitle, jsload;

	init = function(href) {
		window.history.pushState(href, null, href);
		window.history.replaceState(href, null, href);
		get(href);
	};

	pop = function(href) {
		get(href);
	};

	get = async function(href){
		let response = await fetch(href);
		let markup = await response.text();
		
		let page = document.createElement( 'html' );
		page.innerHTML = markup;
		document.querySelector('title').textContent = page.querySelector('title').textContent;
		document.querySelector('bd').innerHTML = page.querySelector('bd').innerHTML;
	};

	return {
		init:init,pop:pop
	};
})();



app.drawer =(function(){
	let open, close, change, push;
	
	open = async function(uri){
		
		nd.drawer = document.getElementById('drawer');
		nd.drawerbody = document.getElementById('drawerbody');
		nd.overflow = document.documentElement.style.overflow;
	
		nd.drawer.classList.add('isactive');
		nd.overflow = 'hidden';

		let res = await fetch(uri);
		let markup = await res.text();

		setTimeout(async function() {
			nd.drawer.classList.add('isvisible');
			nd.drawerbody.innerHTML = await markup;
			
			if( document.getElementById('componentlink') ){
				app.component.init();
			};
			
			if( document.getElementById('pdf') ){
				app.pdf.init();
			};

		}, 50);
	};
	
	close = async function(){
		nd.drawer = document.getElementById('drawer');
		nd.drawerbody = document.getElementById('drawerbody');
		nd.drawer.classList.remove('isvisible');
		nd.overflow = '';
		setTimeout(function () {
			nd.drawer.classList.remove('isactive');
			nd.drawerbody.textContent = "";
		}, 350);
	};
	
	change = async function(uri){
		let res = await fetch(uri);
		let markup = await res.text();
		nd.drawerbody.innerHTML = await markup;	
	};
	
	push = async function(uri){
		app.turbo.init(uri);
		app.drawer.close();
	};

return {
	open:open,
	close:close,
	change:change,
	push:push
	}
})();
