import "jquery";
import "select2";

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  connect() {  
    $(document).on("turbo:before-cache", function(){ 
      $('#fond-metadatum-dropdown').select2('destroy');
    })

   $('#fond-metadatum-dropdown').select2(
    {
      placeholder: "Fon seçiniz",
      allowClear: true,
    }
  );
   
  }
}
