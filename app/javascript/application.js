// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "semantic-ui"

document.addEventListener("turbo:load", function(event){ 
    $('.ui.dropdown').dropdown(); }, false)

document.addEventListener("turbo:render", function(event){ 
    $('.ui.basic.modal').modal('show'); }, false)


