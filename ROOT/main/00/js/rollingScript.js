$(document).ready(function(){

	if( $.cookie( "Notice" ) !="done") {
		$('#topbanner').slideDown('fast');
	}

	$('#close').click(function(){
		if(document.bannerclose.Notice.checked){
			setCookie("Notice","done",1); //1 = 쿠키를 유지할 기간.
		}
		$('#topbanner').slideUp('slow');
	});
	
	$('.rollingView').bxSlider({
		minSlides:1,
		maxSlides:4,
		moveSlides:1,
		slideWidth:100,
		slideMargin:10,
		auto:true,
		autoControls:true,
		speed:1000
		
	});

	$('.rollingView2').bxSlider({
    
    slideWidth: 300,
    minSlides: 1,
    slideMargin: 10,
	auto:true,
	autoControls:true,
	speed:500
  });
});

function setCookie( name, value, expiredays ) { 
	/*
	var todayDate = new Date(); 
	todayDate.setDate( todayDate.getDate() + expiredays ); 
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" ;
	*/

	$.cookie(name, value, {expires:expiredays, path:'/'});
	
} 

function getCookie( name ){
	/*var nameOfCookie = name + "=";
	var x = 0;
	var endOfCookie;
	alert(document.cookie.length);
	while ( x <= document.cookie.length )
	{
		var y = (x+nameOfCookie.length);
		if ( document.cookie.substring( x, y ) == nameOfCookie ) {
			if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
					endOfCookie = document.cookie.length;
			
			var result = unescape( document.cookie.substring( y, endOfCookie ) );
			alert(result);
			return result;
		}
		x = document.cookie.indexOf( " ", x ) + 1;
		if ( x == 0 )
			break;
	}
	return "";*/


}

