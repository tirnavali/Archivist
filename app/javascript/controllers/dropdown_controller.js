import "jquery"
import "semantic-ui"

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {   
    $('.ui.dropdown').dropdown();    
  }
}