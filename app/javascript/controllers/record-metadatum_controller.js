import "jquery";
import "select2"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("select2 is here")

    $('.js-example-basic-multiple').select2();
    $('.select2').select2();
  }
}
