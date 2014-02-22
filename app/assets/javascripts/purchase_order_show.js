function purchaseOrderShowInit() {

	//$('#item_delivery_date_recieved').datepicker("option", "dateFormat", "yy-mm-dd");
 	$.datepicker.setDefaults({ dateFormat: 'MM dd, yy' });

	init_purchase_order_show_contact_details_section();
	init_purchase_order_show_purchase_items_section();
	init_purchase_order_show_item_delivery_section();

	/* Bind best_in_place edits on deliveris to 
	   update_item function which dos an ajax call to get the latest 
	   delivery item count */
	$('.deliveries_section .best_in_place').bind("ajax:success", update_item);
}


