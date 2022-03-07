import "jquery";
import "select2"

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  connect() {    
    console.log("select2 is here");
    let select_multiple = $('#record_metadatum_person_ids');

    $('.select2.basic').select2();
    $('.select2.multiple').select2({
      width: 300,
      minimumInputLength: 3,
      ajax: {
        url: "http://localhost:3000/people/search",
        dataType: "json",       
        delay: 250,        
        data: function (params) {
          var query = {
            term: params.term            
          }
          console.log(query);
          // Query parameters will be ?search=[term]&page=[page]
          return query;
        },
        results: function (data) {
          console.log(data);
          // Transforms the top-level key of the response object from 'items' to 'results'
          return { results: data.items};
        },
        cache: true,
      },
      initSelection: function(element, callback){
        var id = $(element).val();
        if (id !== ""){
          $.ajax("http://localhost:3000/people/"+id, {
              dataType: "json"
          }).done(function(data){callback(data); });
        }
      }

    });
  }
}
