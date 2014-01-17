function init_purchase_order_show_purchase_items_section() {
	
	//Auto-Complete for Items
	$('#purchase_item_item_name').autocomplete({
	source: $('#purchase_item_item_name').data('autocomplete-source'),
	minLength: 2
	});

	//For toggling the Add Purchase Item Form
	$('#hide_new_purchase_item_link, #show_new_purchase_item_link').on('click', 
		toggle_new_purchase_item_row_form);

	//Listener for calculating total price
	$('#purchase_item_quantity, #purchase_item_price').on('focusout', set_new_purchase_item_total);

	
}

function toggle_new_purchase_item_row_form() {
	$('#show_new_purchase_item_link_row').toggle();
	$('#new_purchase_item_row').toggle();
	$('#purchase_item_item_name').focus();
	event.preventDefault();	
}

function set_new_purchase_item_total() {
	qty = $('#purchase_item_quantity').val();
	price = $('#purchase_item_price').val();
	$('#purchase_item_total').val((qty*price));
	$('#purchase_item_total').number(true, 2);
}
