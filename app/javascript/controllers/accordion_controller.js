import "jquery"
import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="removals"
export default class extends Controller {
  connect() {    
    $('.ui.accordion').accordion();
  }
}