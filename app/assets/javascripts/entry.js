$(document).ready(function() {

  var week = $("#entry_week_id"),
      date_box = $("#date"),
      date = $("#entry_date");

  function check_range() {
    var value = week.find('option:selected').text().split(' ~ ');

    date.datepicker('setStartDate', value[0]).datepicker('setEndDate', value[1]);
  }

  function check_week() {
    if (week.val() == '') {
      date_box.hide();
    } else {
      date_box.show();
    }
  }

  week.on('change', function() {
    check_range();
    check_week();
  });

  check_week();

});