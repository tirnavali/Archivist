import "jquery";
import "select2";
import "cocoon";

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  connect() {    
    let select_multiple = $('#record_metadatum_person_ids');

    $('.select.required.select2.basic').select2();
    $(document).ready(function(){
      $('.select.optional .select2.multiple').select2({
        width: 500,
        minimumInputLength: 3,
        ajax: {
          url: "http://localhost:3000/people/search",
          dataType: "json",       
          delay: 250,        
          data: function (params) {
            var query = {
              term: params.term            
            }
            // Query parameters will be ?search=[term]&page=[page]
            return query;
          },
          processResults: function (response) {
            // Transforms the top-level key of the response object from 'items' to 'results'
            return { results: response};
          },
          cache: true,
        },
      });
    })
  }
}
