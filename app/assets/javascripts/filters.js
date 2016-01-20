function loadFilters() {
  $('.filter-name').on('keyup', function (){
    var searchTerm = this.value.toLowerCase();
    $(this).siblings('.task').each(function (index, task) {
      var text = $(task).children('h4.task-title').text().toLowerCase();
      var matches = text.indexOf(searchTerm) !== -1;
      $(task).toggle(matches);
    });
  });

	const statusConverter = {
		'incomplete': false,
		'complete': true
	}

	$('#task_filter_status').on('change', function (){
		var currentStatus = this.value;
		$tasks = $(this).siblings('.task');
    if (currentStatus === "all") {
      $tasks.each(function (index, task){
        $(task).show();
      });
    } else {
      $tasks.each(function (index, task) {
        $(task).toggle($(task).data('status') === statusConverter[currentStatus])
      });
    }
	});

	$('#task_filter_due').on('change', function (){
		var currentDue = this.value;
		$tasks = $(this).siblings('.task');
    if (!currentDue) {
      $tasks.each(function (index, task){
        $(task).show();
      });
    } else {
      $tasks.each(function (index, task) {
        $(task).toggle($(task).data('due') === currentDue)
      });
    }
	});

	$('#task_filter_start').on('change', function (){
		var currentStart = this.value;
		$tasks = $(this).siblings('.task');
    if (!currentStart) {
      $tasks.each(function (index, task){
        $(task).show();
      });
    } else {
      $tasks.each(function (index, task) {
        $(task).toggle($(task).data('start') === currentStart)
      });
    }
	});
}