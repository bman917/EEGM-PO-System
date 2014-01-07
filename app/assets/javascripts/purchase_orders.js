function setup() {

  $('#purchase_order_supplier_name').autocomplete({
    source: $('#purchase_order_supplier_name').data('autocomplete-source'),
    minLength: 2
  });

  addAutoCompleteToContactPersons();

  $('#purchase_order_supplier_name').focus();

  $('form').on('click', '.remove_fields', removeField);
  $('form').on('click', '.add_fields', addField);
  $('form').on('click', '.add_fields', addAutoCompleteToContactPersons);
  $('form').on('click', '.add_fields', focusOnLastContactPersons);
  $('form').on('click', '#notes_title', toggleNotes);


}

function addAutoCompleteToContactPersons() {
	$('input.contact_persons').autocomplete({
    	source: $('input.contact_persons').data('autocomplete-source'),
    	minLength: 2
  	});
}

function focusOnLastContactPersons() {
	$('input.contact_persons:last').focus();
}

function toggleNotes() {
  $('#purchase_order_notes').toggle(200);
  $('div.notes .expand').toggle(200);
  $('div.notes .collapse').toggle(200);
}