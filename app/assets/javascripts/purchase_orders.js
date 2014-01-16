function setup() {

  $('#purchase_order_supplier_name').autocomplete({
    source: $('#purchase_order_supplier_name').data('autocomplete-source'),
    minLength: 2
  });

  addAutoCompleteToItem();

  addAutoCompleteToContactPersons();
  $('.contact_person_section .add_fields').on('click', addAutoCompleteToContactPersons);


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

  $(document).off('keyup'); // This prevents multiple bindings on keyup
  $(document).keyup(keyListeners);
}

function keyListeners() {
  var n = 78;
  var p = 80;
  var i = 73
  //alert(event.keyCode);

  if (event.altKey && event.ctrlKey) {
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
    $('.item_name input[type=text]:last, #item_delivery_item_name').autocomplete({
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

  grand_total = 0;
  $('.total_field').each(function() {
      grand_total += Number($(this).val());
  });

  $('#purchase_order_grand_total_formatted').val(grand_total);
  $('#purchase_order_grand_total_formatted').number(true, 2);

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

function initItemDeliveryDate() {
  $('#item_delivery_date_recieved').datepicker( "setDate", new Date() );
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