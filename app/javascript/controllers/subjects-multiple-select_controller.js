import "jquery";
import "select2";

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() { 
    // this code written because of browser back|forward actions   
    $(document).on("turbo:before-cache", function(){ 
      $('#multiple-subjects').select2('destroy');
    }); 
    $(document).ready(function(){
      $('#multiple-subjects').select2({
        //width: 500,
        placeholder: "Konu seçiniz",
        allowClear: true,
        minimumResultsForSearch: 20,
        minimumInputLength: 2,  
        ajax: {
          url: "http://localhost:3000/subjects.json",
          dataType: "json",          
          delay: 250,
          crossDomain: true,
          type: 'GET',
          data: function (params) {
            var q = {
              term:{name_cont: params.term},
              //commit:"Ara"
            }
            console.log(q)
            // Query parameters will be ?search=[term]&page=[page]
            return q;
          },
          processResults: function (response) {
            console.log("response is : " + response);
            // Transforms the top-level key of the response object from 'items' to 'results'
            return { results: response};
          },
          cache: true,
        },
      });
    })
  }
}
