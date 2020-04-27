
$( "#btn-launch" ).on( "click", function(){
	$('#shuttle').addClass('tr-bottom').css('bottom','2000px');
	$('#smoke-wrapper').addClass('tr-bottom-fast').css('bottom','-20px');
	$('#smoke').addClass('tr-opacity').css('opacity','0');
} );

$( "#btn-reset" ).on( "click", function(){
	$('#shuttle').removeClass('tr-bottom').css('bottom','-75px');
	$('#smoke-wrapper').removeClass('tr-bottom-fast').css('bottom','-100px');
	$('#smoke').removeClass('tr-opacity').css('opacity','1');
} );