import "jquery";
import "select2"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("select2 is here")

    
    $('.select2').select2();
  }
}
