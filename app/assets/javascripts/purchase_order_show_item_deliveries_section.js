function init_purchase_order_show_item_delivery_section() {

	$('#item_delivery_item_name').autocomplete({
	source: $('#item_delivery_item_name').data('autocomplete-source'),
	minLength: 2,
	select: set_delivery_details
	});

	$('#item_delivery_date_recieved').datepicker();
	$('#item_delivery_date_recieved').datepicker("option", "dateFormat", "yy-mm-dd");
	$('#item_delivery_item_name').focus();
	initItemDeliveryDate();

	$('#new_item_delivery').on('submit', addingNewItemDelivery);
	$('.delete_delivery_item_link').add_pending_deletion_class_to_closes_tr_on_click();


	$('#add_delivery_link').on('click',toggleDeliverySection);
	$('#hide_delivery_section_link').on('click', toggleDeliverySection);



}

function toggleDeliverySection(event) {
	$('#add_delivery_link').toggle();
	$('.deliveries_section').toggle();
	$('#item_delivery_item_name').focus();
	event.preventDefault();

}

function addingNewItemDelivery() {
  var item_summary = $('#item_delivery_item_name').val();
  item_summary += " x " + $('#item_delivery_quantity').val();
  item_summary += " " + $('#item_delivery_unit').val();
  $('#new_item_delivery_row').after("<tr class='adding_item_delivery'><td colspan='5'>Saving Item Delivery: " + item_summary +"...</td>");
}