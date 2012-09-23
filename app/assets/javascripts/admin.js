$(document).ready(function(){
	$('.table tbody tr').each(function(){
		$(this).hover(function(){
			$(this).popover('show');
		});
	});
});