$(document).ready(function() {
	$('#mdesc').summernote({
		height: "500px",
		toolbar: [
    // [groupName, [list of button]]
    ['style', ['bold', 'italic', 'underline', 'clear']],
    ['font', ['strikethrough', 'superscript', 'subscript']],
    ['fontsize', ['fontsize']],
    ['color', ['color']],
    ['para', ['ul', 'ol', 'paragraph']],
    ['height', ['height']]
  ]
	});
});
var postForm = function() {
	var content = $('textarea[name="mdesc"]').html($('#mdesc').code());
}

$(".chosen-select").chosen();