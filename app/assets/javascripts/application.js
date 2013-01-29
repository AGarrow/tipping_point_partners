// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .
// make private/public button toggle update hidden field
//= require tinymce-jquery


jQuery(function() {	
	$('.carousel').carousel({
	  interval: 4000
	});	
	
});


$(function () {
    $('.checkall').click(function () {
        $(this).parents('ul').find(':checkbox').attr('checked', this.checked);
    });
});

jQuery(function($) {
  $('div.btn-group[data-toggle-name=*]').each(function(){
    var group   = $(this);
    var form    = group.parents('form').eq(0);
    var name    = group.attr('data-toggle-name');
    var hidden  = group.children('.hidden');
    $('button', group).each(function(){
      var button = $(this);
      button.live('click', function(){
          hidden.val($(this).val());
      });
      if(button.val() == hidden.val()) {
        button.addClass('active');
      }
    });
  });
});





$('#public-announcement').on('click', function(event){
  event.preventDefault();
  var input = $(this).children().find('.hidden');
  if(input.length>0){
    if(input.val().toString() !== $(this).data('value').toString()){
      input.val($(this).data('value')).trigger('change');
    }
  }
});
