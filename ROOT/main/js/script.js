$(function(){
	var fileTarget = $('.filebox .upload_hidden'); 
	
	fileTarget.on('change', function(){ //
		if ($(this).val() == '') {
			var filename = "";
		} else if (window.FileReader) { // modern browser 
			var filename = $(this)[0].files[0].name; 
		} else { // old IE 
			var filename = $(this).val().split('/').pop().split('\\').pop(); 
		} //
		$(this).siblings('.upload_name').val(filename); 
	});


	$(window).on('scroll', function() {
		scrollFn();
	});
	function scrollFn(){				
		scrollTop = $(document).scrollTop();
		var tx = scrollTop+$('#header').position().top+156;
		$('#rquick').css({top:tx+'px'});
	}
	scrollFn();
	
	/* 상단배너 */
	/*
	$('#top_ban_chk').on('click', function(e) {
		e.preventDefault();
		$('#top_ban').hide();
	});
	$('#top_ban .btn_close').on('click', function(e) {
		e.preventDefault();
		$('#top_ban').hide();
		scrollFn();
	});
 */

		$('#pc_gnb .depth1 > li').addClass('on');		
		$('#pc_gnb .depth2 > li').addClass('on');		
		/* pc nav */
	$('.pc #pc_gnb .depth1 > li > a').on('mouseenter focus', function() {
		$('#pc_gnb .depth1 > li, .nav_back').removeClass('on');
		// var $target = $(this).parent();
		// $target.addClass('on');		
		$('#pc_gnb .depth1 > li, .nav_back').addClass('on');		
	});
	// $('.pc #pc_gnb .depth2 > li > a').on('mouseenter focus', function() {
	// 	$('#pc_gnb .depth2 > li, .nav_back').removeClass('on');
	// 	var $target = $(this).parent();
	// 	$target.addClass('on');		
	// });

	// $('.pc #pc_gnb').on('mouseleave', function() {
	// 	$('#pc_gnb .depth1 > li, .nav_back').removeClass('on');
	// });
	// $('.pc #pc_gnb a.last').on('focusout', function() {
	// 	$('#pc_gnb .depth1 > li, .nav_back').removeClass('on');
	// });
	
	/* mobile nav */	
	$('#mobile_gnb .depth1 > li > a').on('click', function(e) {
		e.preventDefault();
		var $target = $(this).parent();
		$('#mobile_gnb li').not($target).removeClass('on');
		$target.toggleClass('on');
	});	
	$('#mobile_gnb .depth2 > li:not(.no_child) > a').on('click', function(e) {
		e.preventDefault();
		var $target = $(this).parent();
		$('#mobile_gnb .depth2 > li').not($target).removeClass('on');
		$target.toggleClass('on');
	});
	$('#mobile_header .btn_menu').on('click', function(e) {
		e.preventDefault();
		$('#mobile_header').toggleClass('menu_open');
		$('#mobile_gnb li').removeClass('on');
		$('.dimmed_bg').toggle();
	});
	$('.dimmed_bg').on('click', function(e) {
		e.preventDefault();
		$('#mobile_header').removeClass('menu_open');
		$('.dimmed_bg').hide();
	});

	/* 서브 메뉴 */
	$('#lnb > ul > li:not(.no_child) > a').on('click', function(e) {
		e.preventDefault();
		var $target = $(this).parent();
		$('#lnb > ul > li').not($target).removeClass('on');
		$target.toggleClass('on');
	});
	$('body').on("click", function(e){
		if($(e.target).closest("#lnb").length == 0){
			$('#lnb li').removeClass('on');
		}
	});
 

	$('.tab_menu1 a').on('click', function(e) {
		e.preventDefault();
		var idx = $(this).parent().index();
		var $target = $(this).parents('.tab_cont').find('.cont');
		$('.tab_menu1 li').removeClass('on');
		$(this).parent().addClass('on');
		$('.tab_cont .cont').removeClass('on');
		$target.eq(idx).addClass('on');
	});
	

});