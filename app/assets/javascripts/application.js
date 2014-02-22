// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require best_in_place
//= require best_in_place.purr
//= require turbolinks
//= require_tree .
//= require jquery.number
//= require hide_toggler

function application_init() {
  $('.best_in_place').best_in_place();
}




function addField(event) {
   time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    $(this).prev().children('input[type=text]').focus();
    addAutoCompleteToContactPersons();
    addAutoCompleteToContactNumbers();
    event.preventDefault();
}

function removeField(event) {
	$(this).prev('input[type=hidden]').val('1');
	$(this).closest('fieldset').hide();
	event.preventDefault();
}

function addDeletingListener(selector_for_link) {
  $('.delete_delivery_item_link').on('click', function(){
    $(this).closest('tr').addClass('pending_deletion');
  });
}

jQuery.fn.add_pending_deletion_class_to_closes_tr_on_click = function() {
    this.on('click', function() {
        $(this).closest('tr').addClass('pending_deletion');
    });
    return this;
}

