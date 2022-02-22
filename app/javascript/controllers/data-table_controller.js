import "jquery"


import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {   
     
    $(document).ready( function () {
        console.log("data-table-ready -- find me in #app/javascript/controllers/data-table_controller.js");
        $('#table_id').DataTable();
    } );
  }
}