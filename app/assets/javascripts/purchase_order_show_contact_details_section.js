function init_purchase_order_show_contact_details_section() {
	addAutoCompleteToContactPersons();
	addAutoCompleteToContactNumbers();

	$('#add_contact_person_link, #hide_new_purchase_order_contact_link').on('click', 
		toggle_new_purchase_order_contact_form);

	$('#contact_detail_section_add_phone_link,  #hide_new_purchase_order_number_link').on('click',
		toggle_new_purchase_order_phone_form);
}

function toggle_new_purchase_order_phone_form(event) {
	$('#contact_detail_section_add_phone_link').toggle();
	$('#contact_numbers #new_phone').toggle();
	$('#phone_number').focus();
	event.preventDefault();	
}

function toggle_new_purchase_order_contact_form(event) {
	$('#add_contact_person_link').toggle();
	$('#new_purchase_order_contact').toggle();
	$('#purchase_order_contact_name').focus();
	event.preventDefault();
}
