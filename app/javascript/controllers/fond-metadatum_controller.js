import "jquery";
import "select2";

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  connect() {    
   
    $('#fond-metadatum-dropdown').select2(
      {
        placeholder: "Fon seçiniz",
        allowClear: true,
        
      }
    );
    // This code is bugy and not working needs to fix
    // $(document).on('select2:open', ()=>{
    //   $(".select2-search__field")[0]
    // })
  }
}
