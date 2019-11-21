$(function() {

	$('input[name=news_sub]').on('click', function() {

		if ($('input[name=news_sub]').is(":checked")) {
			$('input[name=news_sub_tf]').val('1');
		} else {
			$('input[name=news_sub_tf]').val('0');
		}

	});

});
