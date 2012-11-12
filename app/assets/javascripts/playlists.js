// jQuery(function($) {
// 	
// 	$controls = $(".controls");
// 	
// 	scplayer = new SoundCloudPlayer(["/elmandoak/marijuana-chrome-sparks"],{
// 		  consumer_key: "f2334dc770efb325207e4eb621703422"
// 		, autoplay: true
// 		, loop: true
// 		, toggle_pause: true
// 		, preload: true
// 	});
// 	var scwaveform = new SCWaveform(scplayer, {scrub:true});
// 	
// 	$controls.on("click", 'div', function(e){
// 		e.preventDefault();
// 		var $this = $(this)
// 		if( $this.hasClass('play') ){ scplayer.pause(); }
// 		else if( $this.hasClass('pause') ){ scplayer.pause(); }
// 		else if( $this.hasClass('stop') ){ scplayer.stop(); }
// 		else if( $this.hasClass('next') ){ scplayer.next(); }
// 		else if( $this.hasClass('prev') ){ scplayer.prev(); }
// 	});
// 	
// 	scplayer.on("scplayer.pause", function(e, is_paused){
// 		if(is_paused === true){
// 			$controls.find('.play').addClass("pause");
// 		}else{
// 			$controls.find('.play').removeClass("pause");
// 		}
// 	});
// 	
// 	
// 	scplayer.on("scplayer.init", function(e, track, sound){
// 		var $pl = $("#playlist");
// 		$pl.empty();
// 		//
// 		var playlist = scplayer.playlist();
// 		for(var x=0, l=playlist.length; x<l; x++){
// 			var $li = $("<li/>", {"html": "loading.."}).data('index', x).appendTo($pl);
// 			(function(x,$li){
// 				//lookup the track info
// 				scplayer.track_info(x).done(function(track){
// 					//console.log(track);
// 					$li.html(track.title);
// 				});
// 			})(x,$li);			
// 		}
// 	
// 		$("#playlist").find('li:first').addClass('active');
// 	});
// 	
// 	
// 	scplayer.on("scplayer.changing_track", function(e, index){
// 		$("#playlist").find('li').removeClass('active').eq(index).addClass('active');
// 	});
// 	
// 	//click playlist tracks
// 	$("li", "#playlist").live('click', function(e){
// 		var $this = $(this);
// 		scplayer.goto($this.data('index')).play();
// 	});
// 
// });
// 
