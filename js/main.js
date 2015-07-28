$(document).ready(function(){

	$("section").hide();
	$("#"+$("select").val()).show();


	$("span").click(function(){
		 window.prompt("Copy to clipboard: Ctrl+C, Enter", $(this).data($("[type='radio']:checked").val()));
	});

	$("select").change(function(){
		$("section").hide();
		$("#"+$(this).val()).show();
	});

	$('.fa-unsorted').click(function() {
	    var e = document.createEvent('MouseEvents');
	    e.initMouseEvent('mousedown');
	    $('select')[0].dispatchEvent(e);
	});

	$("section span").hover(
	  function() {
	    $("body").css("background",$(this).data("hex"));
	  }, function() {

	  }
	);
});