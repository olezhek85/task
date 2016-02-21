var ready = function() {
	$(".task-check").on('click', function(){
		$.post($(this).data('updatestatus'), { status: $(this).is(":checked") });
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);
