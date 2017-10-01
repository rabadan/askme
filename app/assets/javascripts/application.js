//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree .


$(function(){
    $('#ask-button').click(function(){
        $('#ask-form').slideToggle(300);
        return false;
    });
});