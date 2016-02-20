$( document ).ready(function() {
	$(".task-check").on('click', function(){
		$.post($(this).data('updatestatus'), { status: $(this).is(":checked") });
	});
});
