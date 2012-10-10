$(document).ready(function(){
	$('.table tbody tr td[data-type="tooltip"]').each(function(){
		$(this).hover(function(){
			$(this).popover('show');
		});
	});
	$('.icon-star-empty').on('click', function(e){
		console.log(e);
	});
});