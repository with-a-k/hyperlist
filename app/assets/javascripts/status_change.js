function statusChange() {
	const displayStatus = {
		'true': 'Completed!',
		'false': 'Incomplete'
	}

	const newStatus = {
		'true': 'false',
		'false': 'true'
	}

	$('.task-status').on('click', function (event) {
		var task = $(event.target).closest('.task');
		var currentStatus = task.attr('data-status');
		$.ajax({
			type: 'put',
			url: 'api/v1/tasks/' + task.attr('data-id'),
			data: {
				task: {
					status: newStatus[currentStatus]
				}
			},
			success: function() {
				task.attr('data-status', newStatus[currentStatus]);
				task.find('span.status').text(displayStatus[newStatus[currentStatus]]);
			}
		});
	});
}