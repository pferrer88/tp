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
//= require twitter/bootstrap
//= require jquery.pjax
//= require_tree .

jQuery(function($) {
	
	$('a:not([data-remote]):not([data-behavior]):not([data-skip-pjax])').pjax('[data-pjax-container]');
	
  var showLoading = function() { $("#sc_btn").button('loading') };
	var removeLoading = function() { $("#sc_btn").button('reset') };

	$("#sc_btn").click(showLoading);
	
	console.log("hello console");
	//   $("#sc_search")
	//     .bind("ajax:loading",  showLoading)
	//     .bind("ajax:complete", removeLoading);
	//     .bind("ajax:success", function(event, data, status, xhr) {
	//       $("#response").html(data);
	//     });
});

// function set_tune_vars()
// {
// 	alert("HELLO FUCKER");
// }

