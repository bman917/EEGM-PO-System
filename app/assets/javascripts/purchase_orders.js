function setup() {

  $('#purchase_order_supplier_name').autocomplete({
    source: $('#purchase_order_supplier_name').data('autocomplete-source'),
    minLength: 2
  });

  $('#purchase_order_supplier_name').focus();

  $('form').on('click', '.remove_fields', removePhone);
  $('form').on('click', '.add_fields', addPhone);
	
}
