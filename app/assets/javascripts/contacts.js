function init() {
	$('#contact_name').focus();
}

function addPhone_old() {
	entry = $('div.phone_entry:first');
	$('.phones').append("<div class='phone_entry'>" + entry.html() + "</div>");
	len = $('div.phones input').length;
	$('div.phones label:last').text("Phone "+ len);
	$('div.phones input:last').attr("name","phone_list["+len+"]");
	$('div.phones input:last').focus();
}

