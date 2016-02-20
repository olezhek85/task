$( document ).ready(function() {
  $( "form[id='new_project'], form[id^='edit_project']" ).validate({
    rules: {
    	"project[name]": "required"
	    },
	messages: {
		"project[name]": "Please enter project name."
	},
	errorElement: "em"
  });

});