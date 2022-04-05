import "jquery";
import "select2";
import "cocoon";

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  connect() {    
   
    $('.select.required.select2.basic').select2();
    $(document).ready(function(){
      $('.select.optional .select2.multiple').select2({
        //width: 500,
        minimumInputLength: 3,
        ajax: {
          url: "http://localhost:3000/people/search",
          dataType: "json",       
          delay: 250,        
          data: function (params) {
            //console.log(params);
            var query = {
              term: params.term            
            }
            // Query parameters will be ?search=[term]&page=[page]
            return query;
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
