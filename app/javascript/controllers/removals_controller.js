import { Controller } from "@hotwired/stimulus"
import "jquery"
// Connects to data-controller="removals"
export default class extends Controller {
  connect() {
    console.log("it works")
    $(this.element).fadeOut(5000, "swing")
  }
}
