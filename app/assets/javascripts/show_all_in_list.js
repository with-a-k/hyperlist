function showAllInList() {
	$('.show-all').on('click', function () {
		$(this).siblings('.task').each(function (index, task) {
      $(task).show();
    });
	});
}