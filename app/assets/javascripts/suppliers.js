function init() {
	$('#supplier_name').focus();
}

function addPhone() {
   time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    event.preventDefault();
}

function removePhone(event) {
	$(this).prev('input[type=hidden]').val('1');
	$(this).closest('fieldset').hide();
	event.preventDefault();
}