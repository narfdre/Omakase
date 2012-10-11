$(document).ready(function(){
	$('.table tbody tr td[data-type="tooltip"]').each(function(){
		$(this).hover(function(){
			$(this).popover('show');
		});
	});
	$('.icon-star-empty').on('click', function(e){
		var target = $(e.target),
			id = target.closest('tr').attr('data-id');
		$.ajax({
			url: '/products/' + id + '/featured',
			type: 'PUT',
			success: function(){
				target.addClass('icon-star').removeClass('icon-star-empty');
			}
		});
	});
	$('.icon-star').on('click', function(e){
		var target = $(e.target),
			id = target.closest('tr').attr('data-id');
		$.ajax({
			url: '/products/' + id + '/featured',
			type: 'DELETE',
			success: function(){
				target.addClass('icon-star-empty').removeClass('icon-star');
			}
		});
	});
	$('.icon-check-empty').on('click', function(e){
		var target = $(e.target),
			id = target.closest('tr').attr('data-id');
		$.ajax({
			url: '/products/' + id + '/display',
			type: 'PUT',
			success: function(){
				target.addClass('icon-check').removeClass('icon-check-empty');
			}
		});
	});

	$('[rel="tooltip"]').tooltip();
});