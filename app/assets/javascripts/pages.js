$(document).ready(function() {
	$("#micropost_content").bind("keyup", function(){	
		var maxValue = 140;		
		var charsEntered = $("#micropost_content").val().length;
		var leftChars = maxValue - charsEntered;
		if(leftChars < 0)
		{			
			$("#submit_button").attr('disabled','disabled')
			$("#chars_left").html("<label id=\"chars_left\" class=\"no_space_left\">" + leftChars + " characters left" + "</label>");			
		}
		else
		{
			$("#chars_left").html("<label id=\"chars_left\">" + leftChars + " characters left" + "</label>");
			$("#submit_button").removeAttr('disabled');
		}
	}); 
});