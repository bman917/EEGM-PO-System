function init_purchase_order_show_purchase_items_section() {
	
	//Auto-Complete for Items
	$('#purchase_item_item_name').autocomplete({
	source: $('#purchase_item_item_name').data('autocomplete-source'),
	minLength: 2,
	select: set_price
	});

	//For toggling the Add Purchase Item Form
	$('#hide_new_purchase_item_link, #show_new_purchase_item_link').on('click', 
		toggle_new_purchase_item_row_form);

	//Listener for calculating total price
	$('#purchase_item_quantity, #purchase_item_price').on('focusout', set_new_purchase_item_total);

	//Listener for adding a temporary 'Adding new purchase item row'
	$('#new_purchase_item').on('submit',addingNewPurchaseItem);

	$('#purchase_item_table a.remove_fields').add_pending_deletion_class_to_closes_tr_on_click();

	$('.items_section .best_in_place').bind("ajax:success", recalculate_total);
}

function recalculate_total() {
	
}



function toggle_new_purchase_item_row_form(event) {
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

function addingNewPurchaseItem() {
  var item_summary = $('#purchase_item_item_name').val();
  item_summary += " x " + $('#purchase_item_quantity').val();
  item_summary += " " + $('#purchase_item_unit').val();
  $('#new_purchase_item_row').before("<tr class='adding_purchase_item'><td colspan='7'>Saving Purchase Item: " + item_summary +"...</td>");
}
