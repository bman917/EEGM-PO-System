function purchaseOrderShowInit() {
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

	//initializers for contact_details_section
	init_purchase_order_show_contact_details_section();
	
}

function toggleDeliverySection() {
	$('#add_delivery_link').toggle();
	$('.deliveries_section').toggle();
	event.preventDefault();

}