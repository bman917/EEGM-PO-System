function setup() {

  $('#purchase_order_supplier_name').autocomplete({
    source: $('#purchase_order_supplier_name').data('autocomplete-source'),
    minLength: 2
  });

  addAutoCompleteToItem();


  addAutoCompleteToContactPersons();
  $('.contact_person_section').on('click', '.add_fields', addAutoCompleteToContactPersons);

  $('#purchase_order_supplier_name').focus();

  $('.middle_section').on('click', '.remove_fields', removeField);
  $('.middle_section').on('click', '.add_fields', addField);
  $('form').on('click', '#notes_title', toggleNotes);

  $('.items_section').on('click', '.remove_fields', removeItem);
  $('.items_section').on('click', '.add_fields', addItem);


}

function addAutoCompleteToContactPersons() {
	$('input.contact_persons').autocomplete({
    	source: $('input.contact_persons').data('autocomplete-source'),
    	minLength: 2
  	});
}

function addAutoCompleteToItem() {
    $('.item_name input[type=text]:last').autocomplete({
    source: $('.item_name input[type=text]').data('autocomplete-source'),
    minLength: 2
  });
}

function focusOnLastContactPersons() {
	//$('input.contact_persons:last').focus();
  
}

function toggleNotes() {
  $('#purchase_order_notes').toggle(200);
  $('div.notes .expand').toggle(200);
  $('div.notes .collapse').toggle(200);
}

function addItem() {
   time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $('#items_input_table').append($(this).data('fields').replace(regexp, time));
    addAutoCompleteToItem();
    $('.item_name input[type=text]').focus();
    event.preventDefault();
}

function removeItem(event) {
  $(this).prev('input[type=hidden]').val('1');
  $(this).closest('tr').hide();
  event.preventDefault();
}