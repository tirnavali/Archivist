import "jquery";
import "select2";

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  connect() {    
    $(document).ready(function(){
      $('#multiple-toponyms').select2({
        //width: 500,
        minimumInputLength: 2,
        ajax: {
          url: "http://localhost:3000/toponyms",
          dataType: "json",       
          delay: 250,        
          data: function (params) {
            var q = {
              term:{name_cont: params.term},
              //commit:"Ara"
                  
            }
            // Query parameters will be ?search=[term]&page=[page]
            
            return q;
          },
          processResults: function (response) {
            //console.log(response);
            // Transforms the top-level key of the response object from 'items' to 'results'
            return { results: response};
          },
          cache: true,
        },
      });
    })
  }
}
