import "jquery";
import "select2";
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {   
    // this code written because of browser back|forward actions   
    $(document).on("turbo:before-cache", function(){ 
      $('#multiple-people').select2('destroy');
    }); 
    $(document).ready(function(){
      $('#multiple-people').select2({
        //width: 500,
        placeholder: "Kişi seçiniz",
        allowClear: true,
        minimumResultsForSearch: 20,
        minimumInputLength: 3,         
        ajax: {
          url: "http://localhost:3000/people/search.json",
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
