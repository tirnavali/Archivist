// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "semantic-ui"
import "@rails/activestorage";
import "vanilla-nested"

// ActiveStorage.start()

// document.addEventListener("turbo:load", function(event){ 
//    $('.ui.dropdown').dropdown();
//    console.log("APPLication loaded"); }, false)



document.addEventListener("turbo:frame-render", function(event){ 
    $('.ui.basic.modal').modal('show'); }, false)


