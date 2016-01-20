function filterName() {
  $('.filter-name').on('keyup', function (){
    var searchTerm = this.value.toLowerCase();
    $(this).siblings('.task').each(function (index, task) {
      var text = $(task).children('h4.task-title').text().toLowerCase();
      var matches = text.indexOf(searchTerm) !== -1;
      $(task).toggle(matches);
    });
  });
}