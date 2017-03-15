$(document).on('turbolinks:load', readyf2);
function readyf2() {
	$('.inputfile').on( 'change', function( e )
	{
		console.log("change");
		var fileName = '';
		var labelVal = $(".upload").html();
		fileName = e.target.value.split( '\\' ).pop();
		console.log(fileName);
		if( fileName ){
			$(".upload").html(fileName);
		}
		else{
			$(".upload").html( labelVal );
		}
	});
};