function init_purchase_order_show_item_delivery_section() {

	$('#item_delivery_item_name').autocomplete({
	source: $('#item_delivery_item_name').data('autocomplete-source'),
	minLength: 2
	});

	$('#item_delivery_date_recieved').datepicker();
	$('#item_delivery_date_recieved').datepicker("option", "dateFormat", "yy-mm-dd");
	$('#item_delivery_item_name').focus();
	initItemDeliveryDate();

	$('#new_item_delivery').on('submit', addingNewItemDelivery);
	addDeletingListener();


	$('#add_delivery_link').on('click',toggleDeliverySection);
	$('#hide_delivery_section_link').on('click', toggleDeliverySection);

}

function toggleDeliverySection() {
	$('#add_delivery_link').toggle();
	$('.deliveries_section').toggle();
	event.preventDefault();

}

function addingNewItemDelivery() {
  var item_summary = $('#item_delivery_item_name').val();
  item_summary += " x " + $('#item_delivery_quantity').val();
  item_summary += " " + $('#item_delivery_unit').val();
  $('#new_item_delivery_row').after("<tr class='adding_item_delivery'><td colspan='5'>Saving Item Delivery: " + item_summary +"...</td>");
}

function addDeletingListener() {
  $('.delete_delivery_item_link').on('click', function(){
    $(this).closest('tr').addClass('pending_deletion');
  });
}

