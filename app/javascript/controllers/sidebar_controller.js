import "jquery"
import "semantic-ui"

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  toggle(event) {   
    event.preventDefault();
    $('.ui.sidebar').sidebar('toggle');
  }
}