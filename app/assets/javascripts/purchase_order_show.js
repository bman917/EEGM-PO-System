function purchaseOrderShowInit() {

	//$('#item_delivery_date_recieved').datepicker("option", "dateFormat", "yy-mm-dd");
 	$.datepicker.setDefaults({ dateFormat: 'MM dd, yy' });

	init_purchase_order_show_contact_details_section();
	init_purchase_order_show_purchase_items_section();
	init_purchase_order_show_item_delivery_section();

	
}


