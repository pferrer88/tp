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
//= require jquery.tokeninput
//= require soundmanager
// = require sc-player
// = require sc-player-waveform
//= require_tree .

jQuery(function($) {
	
	
	var pReady = function() { 
		console.log("PLAYER READY onready"); 
	};
	
	
	soundManager.setup({
	  url: window.soundManager.url,
	  onready: pReady,
	  ontimeout: function() {
	    console.log("Soundmanager NOT LOADED!");
	  }
	});
	
	$controls = $(".controls");

	$controls.on("click", 'div', function(e){
		e.preventDefault();
		var $this = $(this)
		if( $this.hasClass('play') ){ 
			playtune.togglePause() ;
			$this.addClass("pause");
		}
		else if( $this.hasClass('pause') ){ 
			if (playtune.paused == true ){
				playtune.togglePause();
				$this.removeClass("pause");
				$this.addClass("play");
			}
		}
		else if( $this.hasClass('stop') ){ playtune.stop(); }
		else if( $this.hasClass('next') ){ playtune.next(); }
		else if( $this.hasClass('prev') ){ playtune.prev(); }
		
	});

	hidePlayer = function() {
		 $("#daplayer").slideUp();
		 $("body").animate({"padding-top" : 0 }, "slow");
		 $("#player_show").fadeIn("slow");
	};
	
	showPlayer = function() {
		 $("#daplayer").slideDown();
		 $("body").animate({"padding-top" : 75 }, "slow");
		 $("#player_show").fadeOut("slow");
	};
	
	// $('a:not([data-remote]):not([data-behavior]):not([data-skip-pjax])').pjax('[data-pjax-container]');
	
  showLoading = function() { $("#sc_btn").button('loading') };
	removeLoading = function() { $("#sc_btn").button('reset') };
	
	$("#player_show").click(showPlayer);	
	$("#player_hide").click(hidePlayer);
	$("#sc_btn").click(showLoading);
	
	//   $("#sc_search")
	//     .bind("ajax:loading",  showLoading)
	//     .bind("ajax:complete", removeLoading);
	//     .bind("ajax:success", function(event, data, status, xhr) {
	//       $("#response").html(data);
	//     });
});


