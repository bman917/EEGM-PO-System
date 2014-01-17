function init_purchase_order_show_contact_details_section() {
	addAutoCompleteToContactPersons();

	$('#add_contact_person_link, #hide_new_purchase_order_contact_link').on('click', 
		toggle_new_purchase_order_contact_form);
	
}

function toggle_new_purchase_order_contact_form() {
	$('#add_contact_person_link').toggle();
	$('#new_purchase_order_contact').toggle();
	event.preventDefault();
}