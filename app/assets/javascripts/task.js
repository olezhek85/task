var ready = function() {
	$(".datetimepicker").datetimepicker();
};

$(document).ready(ready);
$(document).on('page:load', ready);