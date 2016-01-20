function sorters() {
	$('.sort-title').on('click', function() {
		tinysort($(this).siblings('.task'), 'h4.task-title');
	});
}