// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "semantic-ui"
import * as ActiveStorage from "@rails/activestorage";
//import "vanilla-nested"


ActiveStorage.start()
// document.addEventListener("turbo:load", function(event){ 
//    $('.ui.dropdown').dropdown();
//    console.log("APPLication loaded"); }, false)

document.addEventListener("turbo:frame-render", function(event){ 
    //console.log("turbo:frame-render is working application.js");
    $('.ui.basic.modal').modal('show'); }, false)
document.addEventListener("turbo:render", function(event){ 
    $(".error.message").fadeOut(3000, "swing");
    //$("#error explanation").fadeOut(7000, "swing");
 }, false)