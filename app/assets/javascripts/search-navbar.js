
var dateToday = new Date();
var dates = $("#from, #to").datepicker({
    defaultDate: "+1w",
    changeMonth: true,
    numberOfMonths: 3,
    minDate: dateToday,
    onSelect: function(selectedDate) {
        var option = this.id == "from" ? "minDate" : "maxDate",
            instance = $(this).data("datepicker"),
            date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
        dates.not(this).datepicker("option", option, date);
    }
});

$('#sandbox-container .input-daterange').datepicker({
});
