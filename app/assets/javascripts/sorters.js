function sorters() {
	$('.sort-title').on('click', function() {
		tinysort($(this).siblings('.task'), 'h4.task-title');
	});

	$('.sort-status').on('click', function() {
		tinysort($(this).siblings('.task'), {data: 'status'});
	});

	$('.sort-due').on('click', function() {
		tinysort($(this).siblings('.task'), {data: 'due', ignoreDashes: true});
	});
}