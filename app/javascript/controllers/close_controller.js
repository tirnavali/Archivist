import "jquery"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  close(e) {
    $("#search_clues .ui.segment").remove();
  }
}