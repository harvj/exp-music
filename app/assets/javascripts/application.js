// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery_ui
//= require easyXDM
//= require jquery.tokeninput
//= require_tree .

$(document).ready(function() {

  // jQuery UI datepicker
  $('#datepicker').datepicker({
    changeMonth: true,
    changeYear:  true,
    dateFormat: 'yy-mm-dd',
    yearRange: '1951:2012'
  });

  $('#release_artist_tokens').tokenInput('/artists.json', {
    crossDomain: false,
    hintText: "Look up an Artist...",
    prePopulate: $('#release_artist_tokens').data('pre')
  });

});