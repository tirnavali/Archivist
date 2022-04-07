import "jquery";
import "select2";

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  
  connect() {  
    $(document).on("turbo:before-cache", function(){ 
      $('#organizations-dropdown').select2('destroy');
    });
  
    $(document).ready(function(){
      $('#organizations-dropdown').select2({
        //width: 500,
        placeholder: "Kurum seçiniz",
        allowClear: true,
        minimumResultsForSearch: 20,
        minimumInputLength: 3,
        ajax: {
          url: "http://localhost:3000/organizations",
          dataType: "json",       
          delay: 250,        
          data: function (params) {
            var q = {
              term:{name_cont: params.term},
              //commit:"Ara"
            }
            // Query parameters will be ?search=[term]&page=[page]
            //  organizations.json?term[name_cont]=some&[page]=2
            // /organizations.json?term[name_cont]
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
