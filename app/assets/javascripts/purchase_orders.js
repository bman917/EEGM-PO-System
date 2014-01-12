function setup() {

  $('#purchase_order_supplier_name').autocomplete({
    source: $('#purchase_order_supplier_name').data('autocomplete-source'),
    minLength: 2
  });

  addAutoCompleteToItem();


  addAutoCompleteToContactPersons();
  $('.contact_person_section').on('click', '.add_fields', addAutoCompleteToContactPersons);

  addAutoCompleteToContactNumbers();
  $('.contact_details_section').on('click', '.add_fields', addAutoCompleteToContactNumbers);

  $('#purchase_order_supplier_name').focus();

  $('.middle_section').on('click', '.remove_fields', removeField);
  $('.middle_section').on('click', '.add_fields', addField);
  $('form').on('click', '#notes_title', toggleNotes);

  $('.items_section').on('click', '.remove_fields', removeItem);
  $('.items_section').on('click', '.add_fields', addItem);

  getAllItemPriceInput().on('focusout', setTotal );
  getAllItemQuantityInput().on('focusout', setTotal);

  $(document).keyup(keyListeners);

}

function keyListeners() {
  var n = 78;
  var p = 80;
  var i = 73
  //alert(event.keyCode);

  if (event.altKey) {
    if (event.keyCode == p) {
        $('#add_purchase_order_contacts').click();
    }
    else if (event.keyCode == n) {
        $('#add_phones').click();
    }
    else if (event.keyCode == i) {
        $('#add_purchase_items').click();
    }

  }

}

function addAutoCompleteToContactNumbers() {
  $('input.contact_numbers').autocomplete({
      source: $('input.contact_numbers').data('autocomplete-source'),
      minLength: 2
    });
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
    getAllItemPriceInput().on('focusout', setTotal );
    event.preventDefault();
}

function removeItem(event) {
  $(this).prev('input[type=hidden]').val('1');
  $(this).closest('tr').hide();
  event.preventDefault();
}

function setTotal() {
  idstr = $(this).attr('id');
  var id = parseInt(idstr.match(/\d+/),10)

  price = getItemData(id, "price");
  qty   = getItemData(id, "quantity");
  total = parseFloat(qty * price).toFixed(2);
  setItemData(id, "total", total);
}

function getItemData(id, attribute_name) {
  return $("#purchase_order_purchase_items_attributes_" + id + "_" + attribute_name).val();
}

function setItemData(id, attribute_name, val) {
  return $("#purchase_order_purchase_items_attributes_" + id + "_" + attribute_name).val(val);
}

function getAllItemPriceInput() {
  return $('.item_price_column input')
}

function getAllItemQuantityInput() {
  return $('.item_quantity_column input');
}