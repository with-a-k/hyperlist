function showAllInList() {
	$('.show-all').on('click', function () {
		$(this).siblings('.task-holder').children('.task').each(function (index, task) {
      $(task).show();
    });
	});
}