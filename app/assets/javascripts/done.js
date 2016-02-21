var ready = function() {
	$( ".task-check[type=checkbox]" ).change(function(){
	    if($(this).is( ":checked" )) {
	        $(this).closest( "td" ).siblings( ".task-name" ).find( ".task-name-text" ).addClass( "task-done" );
	    } else {
	        $(this).closest( "td" ).siblings( ".task-name" ).find( ".task-name-text" ).removeClass( "task-done" );
	    }
	});
};

$(document).ready(ready);
$(document).on('page:load', ready);

