function purchase_item_index_init() {
	$('#name').autocomplete({
	    source: $('#name').data('autocomplete-source'),
	    minLength: 2
	  });

	// $('#purchase_item_index').dataTable({
 //      bJQueryUI: true,
 //      iDisplayLength: 25
	// });
}