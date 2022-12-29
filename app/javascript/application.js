// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

/* global $ */

import jquery from "jquery"
window.$ = jquery

$(function(){
  setTimeout("$('.flash').fadeOut('slow')", 2000);
});