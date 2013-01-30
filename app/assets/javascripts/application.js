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
//= require jquery-ui-1.10.0.custom
//= require jquery_ujs
//= require jquery-ui-timepicker-addon
//= require livevalidation_standalone
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function() {
    $('#event_start_time').datepicker({
        dateFormat: 'dd/mm/yy'
       // timeFormat: "hh:mm tt"
    });
    $('.arrow-down-actions').live('click', function(e) {
        $('.admin-actions :not($(this).siblings("ul.admin-actions"))').hide();
        $(this).siblings('ul').toggle();
    });

});




