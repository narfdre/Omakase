// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min.js

$(document).ready(function(){
	$('.nav li a').on('click', setActiveNav);

	function setActiveNav(e){
		var currentNav = $(e.target).closest('li'),
			navs = currentNav.siblings();
		navs.removeClass('active');
		currentNav.addClass('active');
	}
	//run as soon as pages loads
	var alerts = $('.alert').not('.alert-error');
	if(alerts.length > 0){
		setTimeout(function(){
			alerts.slideUp();
		}, 5000);
	}
});
